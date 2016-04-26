FROM parent
ARG SCRIPT

#ENV SCRIPT scripts/run.sh

ADD repo-key /
RUN \
  chmod 600 /repo-key && \
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \
  #echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
  mkdir /root/.ssh && \
  ssh-keyscan git.mmlab.be >> /root/.ssh/known_hosts && \
  git clone git@git.mmlab.be:pheyvaer/data-analysis-cli.git

#CMD mkdir key-discovery-cli
#RUN git clone git@git.mmlab.be:pheyvaer/key-discovery-cli.git
WORKDIR data-analysis-cli
RUN npm install
#ADD . .
ADD $SCRIPT ./run.sh

CMD bash -C ./run.sh