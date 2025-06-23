FROM python:3.11-slim
WORKDIR /app

COPY test/http_appapp.py .
RUN pip install flask
EXPOSE 8080
CMD ["python", "app.py"]
