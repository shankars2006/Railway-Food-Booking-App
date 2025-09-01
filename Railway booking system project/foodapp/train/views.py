from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.views import View
from typing import Any

from sympy import Order
from .models import Menu, Station
from django.contrib.auth.decorators import login_required , permission_required
from .forms import ChefLoginForm, LoginForm, OrderForm, RegisterForm, ReporterLoginForm
from django.contrib import messages
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.urls import reverse_lazy
from .models import Order

# Create your views here.

def home(request):
    return render(request, 'train/home.html')


def login(request):
    form = LoginForm()
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():       
            # print('Form data:', request.POST)  # Debugging line
            messages.success(request, 'Login successful.')
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                auth_login(request, user)
                return redirect('menu')  # Redirect to menu page after successful login
        else:
            # print('Form errors:', form.errors)  # Debugging line
            messages.error(request, 'Invalid username or password.')
    return render(request, 'train/login.html', {'form': form})

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            print("User registered successfully.")
            messages.success(request, 'Registration successful. Please log in.')
            return redirect('login')
    return render(request, 'train/register.html')

@login_required
def menu(request):
    # Fetch all menu items from the database
    menu_items = Menu.objects.all()

    # Fetch all unique stations from the database, ordered alphabetically
    stations = Station.objects.all().order_by('name')

    # Pass data to template
    context = {
        'menu_items': menu_items,
        'stations': stations,
    }
    return render(request, 'train/menuitems.html', context)


def logout(request):
    auth_logout(request)
    messages.info(request, "You have successfully logged out.") 
    return redirect('home')



@permission_required('auth.can_access_reporter_page', login_url=reverse_lazy('reporter_login'))
def reporter(request):
    orders = Order.objects.filter(order_completed=True, dispatched=False).order_by('-ordered_at')
    context = {
        'orders': orders
    }
    return render(request, 'train/dispatched.html', context)

@login_required
def dispatch_order(request, order_id):
    if request.method == 'POST':
        order = get_object_or_404(Order, pk=order_id)
        order.dispatched = True
        order.save()
        messages.success(request, f"Order #{order.pk} has been dispatched!")
    return redirect('reporter')

@permission_required('auth.can_access_chef_page', login_url=reverse_lazy('chef_login'))
def chef(request):
    """
    Chef dashboard to view and manage incoming orders.
    """
    orders = Order.objects.filter(order_completed=False).order_by('ordered_at')
    stations = Station.objects.all().order_by('name')
    context = {
        'orders': orders,
        'stations': stations,
    }
    return render(request, 'train/chef_page.html', context )

@login_required
def pickup_order(request, order_id):
    """
    Allows a chef to 'accept' an order.
    """
    if request.method == 'POST':
        order = get_object_or_404(Order, pk=order_id)
        order.order_accepted = True
        order.save()
        messages.success(request, f"Order #{order.pk} has been picked up.")
    return redirect('chef')

@login_required
def complete_order(request, order_id):
    """
    Allows a chef to mark an order as 'completed'.
    """
    if request.method == 'POST':
        order = get_object_or_404(Order, pk=order_id)
        order.order_completed = True
        order.save()
        messages.success(request, f"Order #{order.pk} has been completed.")
    return redirect('chef')


def chef_login(request):
    form = ChefLoginForm()
    if request.method == 'POST':
        form = ChefLoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            
            # Print the submitted data
            print(f"Attempting to authenticate user: {username}")
            
            user = authenticate(request, username=username, password=password)
            
            # Print the result of the authentication attempt
            print(f"Authentication result: {user}")
            
            if user is not None:
                # The authentication was successful
                auth_login(request, user)
                messages.success(request, 'Login successful.')
                return redirect('chef')
            else:
                # The authentication failed
                messages.error(request, 'Invalid username or password.')
    
    return render(request, 'train/chef_login.html', {'form': form})


def reporter_login(request):
    form = ReporterLoginForm()
    if request.method == 'POST':
        form = ReporterLoginForm(request.POST)
        if form.is_valid():       
            # print('Form data:', request.POST)  # Debugging line
            messages.success(request, 'Login successful.')
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                auth_login(request, user)
                return redirect('reporter')
            print("Login Success")  # Redirect to menu page after successful login
        else:
            print('Form errors:', form.errors)  # Debugging line
            messages.error(request, 'Invalid username or password.')
    return render(request, 'train/reporter_login.html')




@permission_required('auth.can_access_reporter_page', login_url=reverse_lazy('reporter_login'))
def dispatched(request):
    """Displays all dispatched orders for viewing."""
    orders = Order.objects.filter(dispatched=True).order_by('-ordered_at')
    context = {
        'orders': orders
    }
    return render(request, 'train/dispatched_orders.html', context)




@login_required
def order_details(request):
    orders = Order.objects.filter(customer=request.user).order_by('-ordered_at')
    context = {
        'orders': orders
    }
    return render(request, 'train/customer_cart.html', context)



@login_required
def details(request, item_id):
    # This view remains unchanged as it is correct.
    item = get_object_or_404(Menu, pk=item_id)
    context = {
        'item': item
    }
    return render(request, 'train/food_details.html', context)

@login_required
def place_order(request, item_id):
    if request.method == 'POST':
        # Create a form instance and populate it with data from the request
        form = OrderForm(request.POST)
        
        # Check if the form is valid
        if form.is_valid():
            # Get the cleaned data from the form
            quantity = form.cleaned_data['quantity']

            # Get the menu item
            item = get_object_or_404(Menu, pk=item_id)

            # Calculate the total price
            total_price = item.price * quantity

            # Create the new Order object
            order = Order.objects.create(
                customer=request.user,
                station=item.available_station,
                item=item,
                quantity=quantity,
                total_price=total_price
            )

            # Redirect to the order details page
            return redirect('order_details')
        
        
    return redirect('details', item_id=item_id)