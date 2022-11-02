FROM python:3.11-slim

WORKDIR /mattdq

ENV SECRET_KEY='$(openssl rand -hex 40)'

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

EXPOSE 8081

CMD python3 manage.py runserver 0.0.0.0:8081