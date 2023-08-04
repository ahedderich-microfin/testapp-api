from python:3.11-bookworm

WORKDIR /app

COPY . /app

RUN python -m venv venv
RUN ./venv/bin/pip install django

CMD ["venv/bin/python", "manage.py", "runserver"]