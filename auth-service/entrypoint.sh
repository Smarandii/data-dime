#!/bin/sh

# Wait for the database to be ready
# Add a loop to check if the database is available if needed

# Apply database migrations
python manage.py makemigrations
python manage.py migrate

# Start the main process
exec "$@"
