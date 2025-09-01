from django.core.management.base import BaseCommand
from train.models import Station, Menu

class Command(BaseCommand):
    help = "Populate database with stations and menu items"
    

    def handle(self, *args, **kwargs):
        

        names = [
            "burger",
            "pizza",
            "pasta",
            "sandwich",
            "salad",
            "sushi",
            "taco",
            "steak",
            "noodles",
            "curry",
        ]

        prices = [5.99, 8.99, 12.49, 15.00, 20.00, 25.50, 30.75, 35.00, 40.99, 50.00]

        descriptions = [
            "A delicious burger with fresh ingredients.",
            "A cheesy pizza with your favorite toppings.",
            "A bowl of pasta with rich sauce.",
            "A healthy sandwich with veggies.",
            "A fresh salad with a variety of greens.",
            "A platter of assorted sushi.",
            "A spicy taco with meat and salsa.",
            "A juicy steak cooked to perfection.",
            "A bowl of noodles with flavorful broth.",
            "A hearty curry with rice.",
        ]

        stations = [
            "Chennai Central",
            "New Delhi",
            "Bangalore City",
            "Mumbai Central",
            "Kolkata",
            "Hyderabad Deccan",
            "Pune Junction",
            "Ahmedabad Junction",
            "Jaipur Junction",
            "Howrah Junction",
        ]

        self.stdout.write("Populating stations...")
        station_objs = []
        for s in stations:
            obj, created = Station.objects.get_or_create(name=s)
            station_objs.append(obj)

        self.stdout.write("Populating menu items...")
        for i in range(len(names)):
            Menu.objects.get_or_create(
                name=names[i],
                price=prices[i],
                description=descriptions[i],
                available_station=station_objs[i],  
            )

        self.stdout.write(self.style.SUCCESS("Database populated successfully!"))
