#Build stage
FROM golang:1.13-buster as builder
WORKDIR /echo
COPY echo.go .
RUN go build

#Final stage
FROM gcr.io/distroless/base-debian10
WORKDIR /
COPY --from=builder /echo  /
EXPOSE 8080
CMD ["/echo"]