from python:3.11-bookworm

WORKDIR /app

COPY . /app

RUN python -m venv venv
RUN ./venv/bin/pip install django requests

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]

ENV PYTHONUNBUFFERED 1

CMD ["venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]