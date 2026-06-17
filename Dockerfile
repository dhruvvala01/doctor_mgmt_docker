# 1. Base Image
FROM python:3.12.3-slim

# 2. Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Working directory
WORKDIR /app

# 4. Linux package (Sirf database client library chahiye, compiler nahi)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# 5. Requirements install karna
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 6. Project code copy karna
COPY . /app/