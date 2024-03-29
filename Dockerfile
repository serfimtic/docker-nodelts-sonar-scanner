FROM ubuntu:20.04
MAINTAINER Serfim TIC

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Base NPM
RUN apt-get update && apt-get install -y \
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
  && apt-get install -y nodejs gcc g++ make

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    cd /usr/bin && \
    ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner sonar-scanner

RUN rm /sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
