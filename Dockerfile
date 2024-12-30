FROM golang:1.20.5

LABEL maintainer="francis<okeke98@gmail.com>"

WORKDIR /app
COPY . .
RUN go mod download

COPY ./pkg/config/config.sample.yaml ./pkg/config/config.yaml
RUN go build -o /app/goshop ./cmd/api

EXPOSE 8888
ENTRYPOINT ["/app/goshop"]
