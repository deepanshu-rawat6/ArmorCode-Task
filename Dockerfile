FROM python:3.9-slim

WORKDIR /app

COPY . .

CMD ["cat", "README.md"]