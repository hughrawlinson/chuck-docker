FROM ubuntu:20.04

RUN apt update && apt install -y build-essential libsndfile1-dev curl bison flex libasound2-dev
RUN curl -O https://chuck.cs.princeton.edu/release/files/chuck-1.4.0.0.tgz
RUN tar -xzvf chuck-1.4.0.0.tgz
RUN cd chuck-1.4.0.0/src && make linux-alsa && make install

COPY render.sh /render.sh

ENTRYPOINT ["/render.sh"]
