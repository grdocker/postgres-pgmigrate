ARG POSTGRES_VERSION=12
FROM postgres:$POSTGRES_VERSION

RUN apt update \
  && apt upgrade -y \
  && apt install -y \
    python3 \
    python3-pip \
    $(dpkg -l | grep -Po "postgresql-\d+" | sed 's/-/-server-dev-/g') \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
RUN pip3 install yandex-pgmigrate

ENV POSTGRES_HOST_AUTH_METHOD=trust
