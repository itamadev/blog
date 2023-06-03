FROM golang:1.19.0-buster AS build

RUN apt update -y 
RUN apt install -y wget
# Install Hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.106.0/hugo_extended_0.106.0_linux-amd64.deb
RUN dpkg -i hugo_extended_0.106.0_linux-amd64.deb
RUN apt-get install -f

WORKDIR /var/hugo/src
COPY . .
RUN hugo --minify

EXPOSE 1313
CMD ["hugo", "server", "--bind", "0.0.0.0"]
