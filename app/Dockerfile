# 1. build stage
FROM python:3.8-slim AS builder

# set working dir in the container
WORKDIR /app

# copy current dir contents into container at /app
COPY requirements.txt .

# install needed packages in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# copy current dir contents into container at /app
COPY . .

# 2. prod stage
FROM python:3.8-slim

WORKDIR /app

COPY --from=builder /app /app

# Run app.py when container launches
CMD ["python", "app.py"]