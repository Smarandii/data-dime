FROM python:alpine3.19

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app/

# Copy the requirements.txt first to leverage Docker cache
COPY ./auth-service/requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY ./auth-service /app/

# Grant execution rights on the entrypoint script
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint script to be executed
ENTRYPOINT ["/app/entrypoint.sh"]


# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]