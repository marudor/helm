apk add --no-cache ca-certificates jq curl bash nodejs aws-cli

helm_amd() {
  # Install helm version 2:
  curl -L ${BASE_URL}/${HELM_2_FILE_AMD} |tar xvz
  mv linux-amd64/helm /usr/bin/helm
  chmod +x /usr/bin/helm
  rm -rf linux-amd64
  # Install helm version 3:
  curl -L ${BASE_URL}/${HELM_3_FILE_AMD} |tar xvz
  mv linux-amd64/helm /usr/bin/helm3
  chmod +x /usr/bin/helm3
  rm -rf linux-amd64
}

helm_arm() {
  # Install helm version 2:
  curl -L ${BASE_URL}/${HELM_2_FILE_ARM} |tar xvz
  mv linux-arm64/helm /usr/bin/helm
  chmod +x /usr/bin/helm
  rm -rf linux-arm64
  # Install helm version 3:
  curl -L ${BASE_URL}/${HELM_3_FILE_ARM} |tar xvz
  mv linux-arm64/helm /usr/bin/helm3
  chmod +x /usr/bin/helm3
  rm -rf linux-arm64
}

ARCH=`uname -m`
if [ "$ARCH" == "aarch64" ]; then
  helm_arm
else
  helm_amd
fi
# Init version 2 helm:
helm init --client-only
