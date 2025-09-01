from django.contrib import admin
from .models import Station, Menu


# Inline menu items under a station
class MenuInline(admin.TabularInline):  # You can use StackedInline for bigger forms
    model = Menu
    extra = 1  # How many empty forms to show by default


@admin.register(Station)
class StationAdmin(admin.ModelAdmin):
    list_display = ("id", "name",)
    search_fields = ("name",)
    inlines = [MenuInline]  # Show menu items inside station page


@admin.register(Menu)
class MenuAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "description", "price", "available_station")
    search_fields = ("name", "description")
    list_filter = ("available_station",)  # Filter menus by station

    # Make station directly editable in the list view
    list_editable = ("available_station", "price",)
