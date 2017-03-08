#!/bin/bash
# 注册latest版本的gitlab-ci-multi-runner
sudo docker run \
  myrepo/gitlab-runner:latest \
  gitlab-ci-multi-runner register -n \
  --url your_gitlab_url\
  --registration-token your_token \
  --executor shell \
  --description Android-Runner

