# COMP5349
Cloud computing

# 服务器部署

## SSH key
把ssh-key/comp5349.pub里的公钥添加到元数据(metadata)-SSH Keys,创建服务器时会自动添加用户 hadoop

## hadoop用户配置
添加无密码sudo权限
（以防万一）统一密码comp5349

## 关闭防火墙
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
## 安装wget
    sudo yum install wget

## JAVA
### 统一版本：jdk8u242

### 安装

    sudo yum install java-1.8.0-openjdk-devel.x86_64

## SCALA
### 统一版本：2.11.12（配合Spark2.4.5）

### 下载
    mkdir ~/Downloads
    cd ~/Downloads && wget https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.tgz
### 解压
    tar -xf scala-2.11.12.tgz
### 移动
    sudo mv ~/Downloads/scala-2.11.12 /usr/lib/jvm/scala-2.11.12

## Hadoop
### 统一版本：2.7.7（配合Spark2.4.5）

### 下载
    cd ~/Downloads && wget http://apache.mirror.amaze.com.au/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz

### 解压
    
    tar -xf hadoop-2.7.7.tar.gz

### 移动
    mkdir -p ~/opt/module
    mv ~/Downloads/hadoop-2.7.7 ~/opt/module/hadoop-2.7.7

## Spark
### 统一版本：2.4.5（配合Hadoop2.7）
### 下载
    cd ~/Downloads && wget http://apache.mirror.amaze.com.au/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
### 解压
    tar -xf spark-2.4.5-bin-hadoop2.7.tgz
### 移动
    mv ~/Downloads/spark-2.4.5-bin-hadoop2.7 ~/opt/module/spark-2.4.5-bin-hadoop2.7

## 环境变量
编辑profile文件
    
    sudo vi /etc/profile

添加(此处待补充）

    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64
    export SCALA_HOME=/usr/lib/jvm/scala-2.11.12
    export HADOOP_HOME=/home/hadoop/opt/module/hadoop-2.7.7
    export SPARK_HOME=/home/hadoop/opt/module/spark-2.4.5-bin-hadoop2.7

重载

    source /etc/profile
    
