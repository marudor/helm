FROM alpine:3.17.0

ENV BASE_URL="https://get.helm.sh"

ENV HELM_2_FILE_AMD="helm-v2.17.0-linux-amd64.tar.gz"
ENV HELM_3_FILE_AMD="helm-v3.8.1-linux-amd64.tar.gz"

ENV HELM_2_FILE_ARM="helm-v2.17.0-linux-arm64.tar.gz"
ENV HELM_3_FILE_ARM="helm-v3.8.1-linux-arm64.tar.gz"
ENV PYTHONPATH="/usr/lib/python3.11/site-packages/"

COPY . /usr/src/

RUN sh /usr/src/install.sh

# RUN apk add --no-cache ca-certificates jq curl bash nodejs aws-cli && \
#     # Install helm version 2:
#     curl -L ${BASE_URL}/${HELM_2_FILE_AMD} |tar xvz && \
#     mv linux-amd64/helm /usr/bin/helm && \
#     chmod +x /usr/bin/helm && \
#     rm -rf linux-amd64 && \
#     # Install helm version 3:
#     curl -L ${BASE_URL}/${HELM_3_FILE_AMD} |tar xvz && \
#     mv linux-amd64/helm /usr/bin/helm3 && \
#     chmod +x /usr/bin/helm3 && \
#     rm -rf linux-amd64 && \
#     rm -rf linux-arm64 && \
#     # Init version 2 helm:
#     helm init --client-only


# ENTRYPOINT ["node", "/usr/src/index.js"]
