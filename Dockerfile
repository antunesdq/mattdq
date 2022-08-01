# 1 
FROM python:3
# 2
USER root
# 3
WORKDIR /app
# 4
ENV PYTHONDONTWRITEBYTECODE=1
# 5
ENV PYTHONUNBUFFERED=1
# 6 Update stuff.
RUN apt-get update && apt-get install -y apt-transport-https
# 7 Install Node
RUN apt install nodejs -y
# 8 Install NPM
RUN apt install npm -y
# 9
COPY . /app

# 10 Install React
RUN npm install --prefix ./djangobackend/reactfrontend -y
# 11 Upgrade pip
RUN python -m pip install --upgrade pip
# 12 Install libaries
RUN pip install -r requirements.txt
# 13 Build React app
RUN npm run build --prefix ./djangobackend/reactfrontend
# 14 Migrate database
RUN python djangobackend/manage.py migrate
# 15 Expose port
EXPOSE 8000 
# 16 Start server
CMD ["python", "djangobackend/manage.py", "runserver", "0.0.0.0:8000"]