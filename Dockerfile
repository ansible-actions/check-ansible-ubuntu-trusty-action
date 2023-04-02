# hadolint ignore=DL3007
FROM ubuntu:trusty

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-ubuntu-trusty-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-ubuntu-trusty-action"

LABEL "com.github.actions.name"="check-ansible-ubuntu-trusty"
LABEL "com.github.actions.description"="Check ansible role or playbook with Ubuntu trusty"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

# hadolint ignore=DL3008,DL3013,DL3042
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    git \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && pip3 install setuptools \
      && pip3 install ansible \
      && ansible --version

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
