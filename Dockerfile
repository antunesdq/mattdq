FROM python:3

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install Node
RUN yum install -y nodejs
# Install NPM
#RUN apt-get install npm

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