FROM alpine:3.14

WORKDIR /app
COPY go.mod /app
COPY main.go /app
RUN go build

CMD ["./cats"]
