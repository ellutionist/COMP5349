# COMP5349
Cloud computing

# 服务器部署

## SSH key
把ssh-key/comp5349.pub里的公钥添加到元数据(metadata)-SSH Keys,创建服务器时会自动添加用户 hadoop

## hadoop用户配置
添加无密码sudo权限
（以防万一）统一密码comp5349

## 关闭防火墙
    systemctl stop firewalld
    systemctl disable firewalld

## JAVA
### 统一版本：jdk8u242

安装

    sudo yum install java-1.8.0-openjdk-devel.x86_64

# Hadoop
### 统一版本：

## 环境变量
编辑profile文件
    
    sudo vi /etc/profile

添加

    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64

重载

    source /etc/profile
    
