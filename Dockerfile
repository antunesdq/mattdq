FROM python:3

USER root

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Update stuff.
RUN apt-get update && apt-get install -y apt-transport-https
# Install Node
RUN apt install nodejs -y
# Install NPM
RUN apt install npm -y

COPY . /app

# Install React
RUN npm install --prefix ./djangobackend/reactfrontend -y
# Install libaries
RUN pip install -r requirements.txt
# Build React app
RUN npm run build --prefix ./djangobackend/reactfrontend
# Migrate database
RUN python djangobackend/manage.py migrate
# Start app
RUN python djangobackend/manage.py runserver