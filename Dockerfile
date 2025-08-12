FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/pallets/flask.git flask-source
WORKDIR /app/flask-source/examples/tutorial
RUN pip install --no-cache-dir flask
ENV PORT=8080
EXPOSE 8080
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
