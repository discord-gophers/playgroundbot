FROM golang:1.20 AS build
WORKDIR /app
ENV CGO_ENABLED 0

RUN git clone https://github.com/LaevusDexter/go-playground-bot.git .
RUN go mod download
RUN go build -o playground

FROM alpine
COPY --from=build /app/playground /app/playground
ENTRYPOINT [ "/app/playground" ]