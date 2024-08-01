# Use the latest Ubuntu image as the base
FROM python:3.12.4-alpine

# Install Python and other dependencies
# Install dependencies
RUN apk update && apk upgrade

# Set the working directory
WORKDIR /app

# TODO: Copy the app directory contents into the container at /app
COPY app/* ./
# TODO: Install Python dependencies
# NOTE: This isn't working
COPY requirements.txt /requirements.txt
RUN apk add --no-cache --virtual .build-deps \
    gcc musl-dev linux-headers && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del .build-deps

# TODO: Expose the port the app runs on
EXPOSE 8000
# TODO: Define the entrypoint for the app

ENTRYPOINT ["python","manage.py","runserver" ]
