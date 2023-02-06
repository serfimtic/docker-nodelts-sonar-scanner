FROM ubuntu:20.04
MAINTAINER Serfim TIC

# Base NPM
RUN apt update && apt install -y \
  locales \
  build-essential \
  git \
  rpm \
  openjdk-8-jdk \
  curl \
  wget \
  jq \
  python \
  rename \
  unzip

ENV SONAR_SCANNER_VERSION 4.2.0.1873

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt install -y nodejs

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    cd /usr/bin && \
    ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner sonar-scanner

RUN rm /sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
