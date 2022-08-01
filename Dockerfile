# 1 
FROM python:3
# 2
USER root
# 3
WORKDIR /app
# 4
ENV PYTHONDONTWRITEBYTECODE=1
# 5
ENV VIRTUAL_ENV=venv
# 6
ENV PYTHONUNBUFFERED=1
# 7 Update stuff.
RUN apt-get update -y
# 8 Upgrade stuff.
RUN apt-get upgrade -y 
# 9 Install stuff.
RUN apt-get install apt-transport-https -y
# 10 Install Node
RUN apt-get install nodejs -y
# 12 Install NPM
RUN apt-get install npm -y
# 12
COPY . /app

# 13 Install React
RUN npm install --prefix ./djangobackend/reactfrontend -y
# 14 Create virtual environment
RUN python -m venv $VIRTUAL_ENV
# 15 Update PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
# 16 Update pip
RUN python -m pip install --upgrade pip
# 17 Install dependencies
RUN pip install -r requirements.txt
# 18 Build frontend
RUN npm run build --prefix ./djangobackend/reactfrontend
# 19 Migrate database
RUN python djangobackend/manage.py migrate
# 20 Expose port
EXPOSE 8000 
# 21 Start server
CMD ["python", "djangobackend/manage.py", "runserver", "0.0.0.0:8000"]