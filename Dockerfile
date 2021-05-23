FROM node:10-alpine

ENV YQ_VERSION="v4.6.3"

RUN apk add --no-cache --virtual .pipeline-deps readline linux-pam \
    && apk add bash sudo shadow \
    && apk del .pipeline-deps

RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -O /usr/local/bin/yq &&\
    chmod +x /usr/local/bin/yq

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"

CMD [ "node" ]