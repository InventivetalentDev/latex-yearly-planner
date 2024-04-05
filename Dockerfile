# Start from the latest golang base image
FROM golang:alpine

# Add Maintainer Info
LABEL maintainer="Your Name <youremail@domain.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Download and install dependencies
RUN apk update && apk add --no-cache git bash texlive-full

COPY ./ /app/

RUN go mod download
RUN go get github.com/kudrykv/latex-yearly-planner/app

RUN ls -la /app

ENV PLANNER_YEAR=2022
ENV CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml"
ENV NAME="sn_a5x.breadcrumb.default"

RUN ["chmod", "+x", "/app/single.sh"]
ENTRYPOINT ["/bin/bash"]
CMD ["/app/single.sh"]