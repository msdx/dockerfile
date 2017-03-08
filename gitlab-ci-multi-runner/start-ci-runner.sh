#!/bin/bash
sudo docker run -d \
  --name gitlab-ci-multi-runner \
  --restart always \
  -v /home/msdx/androd-sdk:/android-sdk:ro \
  myrepo/gitlab-runner:registered \
  gitlab-ci-multi-runner --debug run
