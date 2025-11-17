FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt
COPY . /app
ENV FLASK_CONFIG=prod
EXPOSE 8080
CMD ["gunicorn","-w","3","-b","0.0.0.0:8080","run:app"]
