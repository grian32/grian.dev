FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./
COPY html ./html
COPY static ./static

RUN go mod download
RUN go build -o server ./main.go

FROM alpine:3.19

WORKDIR /app

COPY --from=builder /app/server ./server
COPY html ./html
COPY static ./static

EXPOSE 8080

CMD ["./server"]
