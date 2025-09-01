from django.urls import path
from . import views

urlpatterns = [
     path('', views.home, name='home'), # home page
     path('login/', views.login, name='login'), # login page
     path('register/', views.register, name='register'), # register page
     path('menu/', views.menu, name='menu'),  # list page
     path('details/<int:item_id>/', views.details, name='details'),  # detail page
     path('order_details/', views.order_details, name='order_details'),  # order details page
     path('logout/', views.logout, name='logout'), # logout url
     path('reporter/', views.reporter, name='reporter'), # reporter page
     path('chef/', views.chef, name='chef'),     # chef page
     path('chef_login/', views.chef_login, name='chef_login'), # chef login page
     path('reporter_login/', views.reporter_login, name='reporter_login'), # reporter login page
     path('dispatched/', views.dispatched, name='dispatched'), # dispatched orders page
     path('place_order/<int:item_id>/', views.place_order, name='place_order'), # place order url
     path('chef/pickup/<int:order_id>/', views.pickup_order, name='pickup_order'), # chef pickup order url
     path('chef/complete/<int:order_id>/', views.complete_order, name='complete_order'),  # chef complete order url
     path('dispatch_order/<int:order_id>/', views.dispatch_order, name='dispatch_order'), # dispatch order url
]
