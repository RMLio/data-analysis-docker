FROM ubuntu:15.10

#ENV SCRIPT scripts/run.sh

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y python