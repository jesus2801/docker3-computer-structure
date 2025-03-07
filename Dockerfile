FROM docker:dind

WORKDIR /app

COPY . .

RUN apk add --no-cache bash
