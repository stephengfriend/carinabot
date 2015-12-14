# For simplicity, we will use the public node image
FROM node
MAINTAINER Stephen G. Friend, stephen.g.friend@gmail.com

ENV BOTDIR /opt/bot

RUN mkdir ${BOTDIR}

# These step allows us to cache our node_modules
COPY package.json ${BOTDIR}
RUN cd ${BOTDIR} && npm install
COPY . ${BOTDIR}

WORKDIR ${BOTDIR}

CMD bin/hubot
