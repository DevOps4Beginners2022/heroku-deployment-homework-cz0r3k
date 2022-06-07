FROM golang:1.17-alpine
ARG PORT=8090
ARG PROJECT_DIR=/app

ENV PORT=${PORT}

RUN mkdir $PROJECT_DIR && cd ${PROJECT_DIR}
WORKDIR $PROJECT_DIR

EXPOSE ${PORT}

COPY go.mod go.sum main.go $PROJECT_DIR/
RUN go mod download && go mod verify

RUN go build -o app-server

CMD go run main.go