# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Install Python and other dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Set the working directory
WORKDIR /app

# TODO: Copy the current directory contents into the container at /app

# TODO: Install Python dependencies

# TODO: Expose the port the app runs on

# TODO: Define the entrypoint for the app

