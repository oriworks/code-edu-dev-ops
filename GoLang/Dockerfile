FROM golang:alpine AS builder

WORKDIR $GOPATH/src/mylekkepackage/mylekkeapp/
ADD code-edu-rocks.go .
RUN go build -o /go/code-edu-rocks

FROM scratch

COPY --from=builder /go/code-edu-rocks /go/code-edu-rocks

CMD ["/go/code-edu-rocks"]