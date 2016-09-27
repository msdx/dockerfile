Gitlab-ci-multi-runner Dockerfile
===


环境如下：

- ubuntu 15.04
- openjdk-8

##构建docker image
保存该Dockerfile到你本地，然后进入你的`Dockerfile`所在的文件，执行以下命令：
```shell
sudo docker build -t myrepo/gitlab-ci-runner .
```
注意：

1. 上面的`myrepo/gitlab-ci-runner`可以换成你自己的repo名及image名。
2. 上面的`.`是你的`Dockerfile`所在的目录，如果不是在当前目录，则换成其对应的目录名。

##gitlab-ci-multi-runner的注册
我们通过上面构建的镜像启动我们的容器，命令如下：
```shell
sudo docker run -it --name gitlab-ci-runner myrepo/gitlab-ci-runner
```
首次使用需要把你的gitlab-ci-mutli-runner注册到你的gitlab中，具体可参考官方文档：https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/install/linux-repository.md 。这里简要说一下：
1. 执行以下命令：
```shell
gitlab-ci-multi-runner register
```
然后会有一步步的提示，让你输入，如下：
```shell
Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com )
https://gitlab.com (这个是示例，具体地址请参考下面说明)
Please enter the gitlab-ci token for this runner
xxx
Please enter the gitlab-ci description for this runner
my-runner
INFO[0034] fcf5c619 Registering runner... succeeded
Please enter the executor: shell, docker, docker-ssh, ssh?
shell
```
你可以注册为一个Shared runner或者是Specific runner,由你在第一个提示中输入的地址决定。如你直接输入的是你公司的gitlab地址，则为Shared runner，对应的token在gitlab管理界面打开Runners可以看到。如果想注册为Specific runner，你需要进入你的gitlab上的项目的设置，在其Runners上按照Specific runners的提示输入URL和token。

最后运行方式选择shell方式即可。

##Android环境
你需要在宿主机上下载好Android-sdk，然后在运行的时候挂载，通过运行时的-v参数(`-v host/android-sdk/path:docker/android-sdk/path:permission`)。可参考这里的`start-ci-runner.sh`文件。

我们假设运行的时候都会把android-sdk挂载到/android-sdk下，那么我们还需要把这个目录配置到`ANDROID_HOME`环境变量中。也就是在上面注册runner之后，先不要退出来，先设置一下环境变量再退出。

##保存images
最后，我们需要把我们的container所做的修改进行提交，如下：
```shell
sudo docker commit -m "Register gitlab-ci-multi-runner" 3771858d86bd myrepo/gitlab-ci-runner:registered
```

下次就可以直接启动它了。
