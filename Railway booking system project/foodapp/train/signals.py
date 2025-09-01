# your_app_name/signals.py
from django.db.models.signals import post_migrate
from django.dispatch import receiver
from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType

@receiver(post_migrate)
def create_groups_permissions(sender, **kwargs):
    # Ensure this runs only for your specific app's migrations
    if sender.name == 'train':  # Replace 'train' with your app's name
        # Create or get the 'Chef' group
        chef_group, created_chef = Group.objects.get_or_create(name='Chef')
        
        # Create or get the 'Reporter' group
        reporters_group, created_reporter = Group.objects.get_or_create(name='Reporter')

        # Create custom permissions for accessing specific views
        content_type = ContentType.objects.get_for_model(Group)

        # Permission for Chef page
        chef_permission, created_chef_perm = Permission.objects.get_or_create(
            codename='can_access_chef_page',
            name='Can access Chef pages',
            content_type=content_type,
        )

        # Permission for Reporter page
        reporter_permission, created_reporter_perm = Permission.objects.get_or_create(
            codename='can_access_reporter_page',
            name='Can access Reporter pages',
            content_type=content_type,
        )

        # Add the custom permissions to their respective groups
        chef_group.permissions.add(chef_permission)
        reporters_group.permissions.add(reporter_permission)

        if created_chef or created_reporter:
            print("Groups and permissions have been created successfully!")  