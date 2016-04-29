FROM parent
ARG SCRIPT

RUN git clone git@github.com:RMLio/data-analysis-cli.git
WORKDIR data-analysis-cli
RUN npm install
ADD $SCRIPT ./run.sh

CMD bash -C ./run.sh
