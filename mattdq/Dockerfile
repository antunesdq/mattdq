FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /mattdq
COPY requirements.txt /mattdq/
RUN pip install -r requirements.txt
COPY . /mattdq/