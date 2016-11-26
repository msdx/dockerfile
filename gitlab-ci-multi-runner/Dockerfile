FROM ubuntu:15.04

MAINTAINER HuangHaohang <msdx.android@qq.com>

ENV ANDROID_HOME /android-sdk

RUN apt update && apt install -y openjdk-8-jdk curl

#如果遇到android-sdk里的命令无法执行，则需要安装32位的动态链接库。
RUN apt install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash

RUN apt-get install -y gitlab-ci-multi-runner

# Ensure UTF-8 locale
#COPY locale /etc/default/locale
RUN locale-gen zh_CN.UTF-8 && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8 
ENV LANG zh_CN.UTF-8 
ENV LANGUAGE zh_CN:zh 
ENV LC_ALL zh_CN.UTF-8
