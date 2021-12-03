# ttnode-arm

#### 介绍
安装armbian版甜糖脚本

#### 软件架构
arm64位和arm32位系统


甜糖安装教程

1.  创建/mnt文件夹以及挂载硬盘
    （1）用命令`mkdir /mnts`创建/mnts文件夹，
    （2）挂载磁盘，命令：`mount /dev/sda1 /mnts`其中sda1要根据实际的磁盘分区名称挂载，通过命令：`lsblk` 查看u盘或硬盘的磁盘分区名称（通过容量大小来确认）
2.  创建定时任务
    （1）创建crontab文件，命令：`crontab -e`
    （2）添加定时任务，在crontab末尾加入命令：`* * * * * /usr/node/crash_monitor.sh`
3.  运行甜糖安装脚本
    （1）命令：`apt update;apt install -y git;git clone https://gitee.com/zhang0510/ttnode-arm.git;chmod 777 ./ttnode-arm/tt_run.sh;./ttnode-arm/tt_run.sh;`



#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
