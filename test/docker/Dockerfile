FROM python:3.11-slim
WORKDIR /test/app

COPY app.py .
RUN pip install flask
EXPOSE 8080
CMD ["python", "app.py"]
