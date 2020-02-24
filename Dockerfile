FROM ubuntu:trusty

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-ubuntu-trusty-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-ubuntu-trusty-action"

LABEL "com.github.actions.name"="check-ansible-ubuntu-trusty"
LABEL "com.github.actions.description"="Check ansible role or playbook with Ubuntu trusty"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN apt-get update -y && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    python-dev \
    python-pip \
    git \
    systemd

RUN pip install setuptools && pip install ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
