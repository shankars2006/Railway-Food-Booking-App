from django.db import models
from django.contrib.auth.models import User


class Station(models.Model): # Represents a railway station
    name = models.CharField(max_length=100, unique=True)
    
    class Meta:
        ordering = ['name']

    def __str__(self):
        return self.name


class Menu(models.Model): # Represents a menu item available at a station
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=6, decimal_places=2)
    description = models.TextField()
    available_station = models.ForeignKey(
        Station,
        on_delete=models.CASCADE,
        related_name="menu_items"
    )

    class Meta:
        ordering = ['name']

    def __str__(self):
        return f"{self.name} at {self.available_station.name}"


class Order(models.Model): # Represents an order placed by a user
    customer = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="orders",
        help_text="The user who placed the order."
    ) # customer who placed the order

    station = models.ForeignKey(
        Station,
        on_delete=models.CASCADE,
        related_name="orders",
        help_text="The station where the order is being prepared."
    ) # station where the order is placed

    item = models.ForeignKey(
        Menu,
        on_delete=models.CASCADE,
        related_name="orders",
        help_text="The menu item that was ordered."
    ) # item ordered

    quantity = models.PositiveIntegerField(
        default=1,
        help_text="The quantity of the item ordered."
    ) # quantity ordered

    total_price = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        help_text="The total price for this order item (quantity * item price)."
    ) # total price for this order item

    order_accepted = models.BooleanField(
        default=False,
        help_text="Indicates whether a chef has accepted the order."
    ) # order accepted by chef or not

    order_completed = models.BooleanField(
        default=False,
        help_text="Indicates whether a chef has completed the order."
    ) # order completed by chef or not

    dispatched = models.BooleanField(
        default=False,
        help_text="Indicates whether the order has been dispatched for delivery."
    ) # order dispatched or not

    ordered_at = models.DateTimeField(
        auto_now_add=True,
        help_text="The timestamp when the order was placed."
    ) # timestamp when the order was placed

    class Meta:
        ordering = ['-ordered_at']

    def __str__(self):
        return f"Order #{self.pk} by {self.customer.username} for {self.item.name}"
