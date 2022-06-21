FROM golang:1.7.4-alpine3.5 As build

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build main.go

#FROM gcr.io/distroless/base-debian10

FROM scratch

#FROM alpine:3.5

WORKDIR /app

COPY --from=build /app .


ENTRYPOINT ["./main"]