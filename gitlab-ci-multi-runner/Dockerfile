FROM ubuntu:15.04

MAINTAINER HuangHaohang <huanghaohang@parkingwang.com>

RUN apt update && apt install -y openjdk-8-jdk curl

#如果遇到android-sdk里的命令无法执行，则需要安装32位的动态链接库。
RUN apt install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash

RUN apt-get install -y gitlab-ci-multi-runner

RUN echo "zh_CN.UTF-8 UTF-8" > /var/lib/locales/supported.d/local \
  && echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local \
  && dpkg-reconfigure locales \
  && export LC_ALL=zh_CN.UTF-8 \
  && export LANG=zh_CN.UTF-8


