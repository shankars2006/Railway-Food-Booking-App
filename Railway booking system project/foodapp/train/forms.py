from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate

class RegisterForm(forms.ModelForm):
    username = forms.CharField(label= 'Username',max_length=150, required=True)
    email = forms.EmailField(label= 'Email Address', required=True)
    password = forms.CharField(label= 'Password', widget=forms.PasswordInput, required=True)
    password_confirm = forms.CharField(label= 'Confirm Password', widget=forms.PasswordInput, required=True)
    
    class Meta:
        model = User
        fields = ['username', 'email', 'password']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        password_confirm = cleaned_data.get("password_confirm")

        if password and password_confirm and password != password_confirm:
            raise forms.ValidationError("Passwords do not match.")
        
        return cleaned_data
    
class LoginForm(forms.Form): # For user login
    username = forms.CharField(label='Username', required=True)
    password = forms.CharField(label='Password', widget=forms.PasswordInput, required=True)

    # def clean(self):
    #     cleaned_data = super().clean()
    #     username = cleaned_data.get("username")
    #     password = cleaned_data.get("password")
    #     if username and password:
    #         user = authenticate(username=username, password=password)
    #         if user is None:
    #             raise forms.ValidationError("Invalid username or password.")
    #     return cleaned_data
            
class ChefLoginForm(forms.Form): # For chef login
    username = forms.CharField(label='Username', required=True)
    password = forms.CharField(label='Password', widget=forms.PasswordInput, required=True)

class ReporterLoginForm(forms.Form): # For reporter login
    username = forms.CharField(label='Username', required=True)
    password = forms.CharField(label='Password', widget=forms.PasswordInput, required=True)


class OrderForm(forms.Form): # to collect order quantity
    # This field is for the quantity input from the food_details.html template
    quantity = forms.IntegerField(min_value=1)