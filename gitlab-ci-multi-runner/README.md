Gitlab-ci-multi-runner Dockerfile
===


环境如下：

- ubuntu 15.04
- openjdk-8

## 构建docker image
保存该Dockerfile到你本地，然后进入你的`Dockerfile`所在的文件，执行以下命令：
```shell
sudo docker build -t myrepo/gitlab-runner .
```
注意：

1. 上面的`myrepo/gitlab-runner`可以换成你自己的repo名及image名。
2. 上面的`.`是你的`Dockerfile`所在的目录，如果不是在当前目录，则换成其对应的目录名。

## 使用docker
首次使用需要把你的gitlab-ci-mutli-runner注册到你的gitlab中，具体可参考官方文档：https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/install/linux-repository.md 。这里简要说一下：

### 1.注册runner
修改`register-ci-runner.sh`脚本中的`your_gitlab_url`及`your_token`的值，然后执行该脚本进行注册。
### 2.提交注册后的docker
执行以下命令：
```shell
sudo docker ps -a
```
查看刚才所执行的docker的最后的id，然后将下面命令的`$id`换成你所看到的id，在终端中执行，将注册后的状态进行提交：
```shell
sudo docker commit -m "Register gitlab-ci-multi-runner" $id your/gitlab-runner:registered
```
### 3.运行docker
修改项目中的`start-ci-runner.sh`脚本中的`/home/msdx/androd-sdk`为你的Android SDK的路径，然后执行该脚本以启动docker。

## 升级gitlab-ci-multi-runner
项目中的`update-ci-runner.sh`脚本是升级gitlab-ci-multi-runner版本的，可以执行它升级，然后使用前面的方式将升级后的状态保存。
