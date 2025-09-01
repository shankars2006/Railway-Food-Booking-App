[README (1).md](https://github.com/user-attachments/files/22073162/README.1.md)
# Railway Food Booking App

A Django-based web application that enables customers to order food on trains while providing management tools for chefs and reporters to handle orders efficiently.

## 🚂 Overview

The Railway Food Booking System is a comprehensive platform designed to streamline food ordering services for railway passengers. The application features role-based access control with distinct interfaces for customers, chefs, and administrative staff (reporters).

## ✨ Features

### For Customers
- **User Registration & Authentication**: Secure account creation and login
- **Menu Browsing**: View available food items at different railway stations
- **Easy Ordering**: Select items, specify quantities, and place orders
- **Order Tracking**: View order history and current order status
- **Station-Specific Menus**: Browse items available at specific railway stations

### For Chefs
- **Order Management Dashboard**: View and manage incoming orders
- **Order Processing**: Accept and mark orders as completed
- **Real-time Updates**: Track order preparation status
- **Station-Based Workflow**: Manage orders specific to their station

### For Reporters (Management)
- **Analytics Dashboard**: View completed and dispatched orders
- **Order Reporting**: Generate comprehensive order reports
- **Dispatch Management**: Mark orders as dispatched for delivery
- **Performance Insights**: Track order fulfillment metrics

## 🛠️ Technology Stack

- **Backend**: Python 3.x with Django 5.1.7
- **Database**: MySQL 8.0.41
- **Frontend**: HTML5, CSS3, Django Templates
- **Authentication**: Django's built-in authentication system
- **Forms**: Django Forms with validation

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- Python 3.7 or higher
- MySQL 8.0 or higher
- Git

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/shankars2006/Railway-Food-Booking-App.git
cd "Railway booking system project/foodapp"
```

### 2. Create Virtual Environment
```bash
python -m venv venv

# On Windows
venv\Scripts\activate

# On macOS/Linux
source venv/bin/activate
```

### 3. Install Dependencies
```bash
pip install Django mysqlclient
```

### 4. Database Setup

#### Configure MySQL Database:
1. Create a MySQL database named `food`
2. Update database credentials in `foodapp/settings.py`:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'food',
        'USER': 'your_mysql_username',
        'PASSWORD': 'your_mysql_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

#### Apply Migrations:
```bash
python manage.py migrate
```

#### Load Initial Data:
```bash
mysql -u root -p food < food.sql
```

### 5. Create Superuser (Optional)
```bash
python manage.py createsuperuser
```

### 6. Run the Application
```bash
python manage.py runserver
```

Visit `http://127.0.0.1:8000/` in your browser to access the application.

## 📱 Usage

### For New Users:
1. **Register**: Create a new account using the registration form
2. **Login**: Access your account using your credentials
3. **Browse Menu**: View available food items at different stations
4. **Place Order**: Select items, specify quantity, and confirm order
5. **Track Orders**: Monitor your order status in the customer dashboard

### For Chefs:
1. **Login**: Use chef credentials to access the chef dashboard
2. **View Orders**: See all pending orders requiring attention
3. **Process Orders**: Accept orders and mark them as completed
4. **Update Status**: Keep customers informed about order progress

### For Reporters:
1. **Login**: Access the reporter dashboard with appropriate credentials
2. **View Reports**: Monitor completed orders and performance metrics
3. **Dispatch Orders**: Mark completed orders as dispatched
4. **Generate Analytics**: Access comprehensive order reports

## 🗂️ Project Structure

```
Railway-Food-Booking-App/
└── Railway booking system project/
    └── foodapp/
        ├── manage.py                 # Django management script
        ├── requirements.txt          # Python dependencies
        ├── db.sqlite3               # SQLite database (alternative)
        ├── food.sql                 # MySQL initial data
        ├── foodapp/                 # Main Django project
        │   ├── __init__.py
        │   ├── settings.py          # Django configuration
        │   ├── urls.py              # Main URL routing
        │   ├── wsgi.py              # WSGI configuration
        │   └── asgi.py              # ASGI configuration
        └── train/                   # Django app
            ├── models.py            # Database models
            ├── views.py             # View controllers
            ├── forms.py             # Django forms
            ├── urls.py              # App URL routing
            ├── admin.py             # Admin configuration
            ├── apps.py              # App configuration
            ├── signals.py           # Django signals
            ├── tests.py             # Unit tests
            ├── migrations/          # Database migrations
            └── templates/train/     # HTML templates
                ├── home.html
                ├── login.html
                ├── register.html
                ├── menuitems.html
                ├── food_details.html
                ├── customer_cart.html
                ├── chef_login.html
                ├── chef_page.html
                ├── reporter_login.html
                ├── reporter.html
                └── dispatched_orders.html
```

## 🔧 Configuration

### Database Models

**Station Model**: Represents railway stations
- `name`: Unique station name

**Menu Model**: Food items available at stations  
- `name`: Item name
- `price`: Item price (decimal)
- `description`: Item description
- `available_station`: Foreign key to Station

**Order Model**: Customer orders
- `customer`: Foreign key to User
- `station`: Foreign key to Station  
- `item`: Foreign key to Menu
- `quantity`: Number of items ordered
- `total_price`: Calculated total price
- `order_accepted`: Chef acceptance status
- `order_completed`: Completion status
- `dispatched`: Dispatch status
- `ordered_at`: Order timestamp

### User Roles & Permissions

The system implements three user roles with specific permissions:

1. **Customers**: Can browse menus and place orders
2. **Chefs**: Can view and manage orders (requires `can_access_chef_page` permission)
3. **Reporters**: Can view analytics and dispatch orders (requires `can_access_reporter_page` permission)

## 🔒 Security Features

- **CSRF Protection**: All forms include CSRF tokens
- **User Authentication**: Secure login/logout functionality
- **Permission-Based Access**: Role-based access control
- **Password Hashing**: Secure password storage using Django's built-in hashing
- **SQL Injection Prevention**: Django ORM provides protection against SQL injection

## 🧪 Testing

Run the test suite using:
```bash
python manage.py test
```

## 🚀 Deployment

For production deployment:

1. **Set DEBUG = False** in settings.py
2. **Configure ALLOWED_HOSTS** with your domain
3. **Use a production WSGI server** like Gunicorn
4. **Set up a reverse proxy** with Nginx or Apache
5. **Configure static file serving**
6. **Set up SSL/HTTPS**

Example production setup:
```bash
# Install Gunicorn
pip install gunicorn

# Run with Gunicorn
gunicorn foodapp.wsgi:application --bind 0.0.0.0:8000
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/shankars2006/Railway-Food-Booking-App/issues) page
2. Create a new issue if your problem isn't already reported
3. Provide detailed information about the problem and your environment

## 🙏 Acknowledgments

- Django community for the excellent framework
- MySQL team for the robust database system
- Contributors and testers who helped improve this project

## 📈 Future Enhancements

- **Mobile App**: Native Android/iOS applications
- **Payment Integration**: Online payment gateway support  
- **Real-time Notifications**: Push notifications for order updates
- **Advanced Analytics**: Enhanced reporting and insights
- **Multi-language Support**: Internationalization features
- **API Development**: RESTful APIs for third-party integration

---

**Repository**: https://github.com/shankars2006/Railway-Food-Booking-App  
**Version**: 1.0  
**Last Updated**: September 2025
