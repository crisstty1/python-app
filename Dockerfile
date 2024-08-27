FROM python:3.10-slim

RUN useradd --user-group --system --no-log-init --create-home python \
    && mkdir -p /home/python/app && chown -R python:python /home/python/app
WORKDIR /home/python/app

USER python

COPY --chown=python:python . .
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "app.py"]