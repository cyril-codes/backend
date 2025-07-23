# BUILD stage
FROM golang:1.24.2 AS build

WORKDIR /src

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/server .

# RUN stage
FROM alpine:latest

COPY --from=build /bin/server /bin/

EXPOSE 8000

CMD ["/bin/server"]