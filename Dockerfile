FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y build-essential libsndfile1-dev curl bison flex libasound2-dev
RUN curl -O https://chuck.cs.princeton.edu/release/files/chuck-1.4.0.1.tgz
RUN tar -xzvf chuck-1.4.0.1.tgz
RUN cd chuck-1.4.0.1/src && make linux-alsa && make install

COPY render.sh /render.sh

ENTRYPOINT ["/render.sh"]
