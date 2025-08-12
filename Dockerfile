FROM python:3.11-slim
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git

# Clone a working Flask sample repo
RUN git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git flask-source

# Go into a minimal hello world sample
WORKDIR /app/flask-source/run/hello-broken-but-fixed
# If that path doesn't exist in your clone, use a known one:
WORKDIR /app/flask-source/run/hello-broken-but-fixed

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set env vars for Flask
ENV PORT=8080
ENV PYTHONUNBUFFERED=1

EXPOSE 8080
CMD ["python", "main.py"]
