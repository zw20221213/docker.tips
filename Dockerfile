FROM python:3.9.5-slim AS builder

COPY ./ /app

WORKDIR /app

RUN pip install -r requirements.txt && \
    apt-get update && apt-get install -y build-essential && \
    make html


FROM nginx:1.23.1-alpine

COPY --from=builder /app/build/html /usr/share/nginx/html

