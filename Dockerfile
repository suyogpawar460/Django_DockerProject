# Dockerfile

# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.11.3

# Mounts the application code to the image
ENV PYTHONUNBUFFERED=1

# Set working directory
RUN mkdir core
# set the working directory
COPY . /core/
# coppy commands
WORKDIR /core

# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000

# runs the production server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]