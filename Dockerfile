FROM ubuntu:15.10
ARG SCRIPT

#ENV SCRIPT scripts/run.sh

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y python

ADD repo-key /
RUN \
  chmod 600 /repo-key && \
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \
  #echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
  mkdir /root/.ssh && \
  ssh-keyscan git.mmlab.be >> /root/.ssh/known_hosts && \
  git clone git@git.mmlab.be:pheyvaer/key-discovery-cli.git

#CMD mkdir key-discovery-cli
#RUN git clone git@git.mmlab.be:pheyvaer/key-discovery-cli.git
WORKDIR key-discovery-cli
RUN npm install
#ADD . .
ADD $SCRIPT ./run.sh

CMD bash -C ./run.sh