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

## 配置master免密登录所有slave

### hosts
    vim /etc/hosts

添加

    35.197.164.185 hadoop-master
    
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

### 配置文件

#### $HADOOP_HOME/etc/hadoop/hadoop-env.sh 
Hadoop启动前执行的，配置环境变量的脚本，类似/etc/profile和～/.bash_profile，最低限度是需要配置好JAVA_HOME，否则Hadoop无法运行

    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64/

#### $HADOOP_HOME/etc/hadoop/core-site.xml
核心配置文件

    <configuration>
        <!-- namenode节点位置 -->
        <property>
            <name>fs.default.name</name>
            <value>hdfs://hadoop-master:9000/</value>
        </property>
        
        <property>
            <name>hadoop.tmp.dir</name>
            <value>/home/hadoop/opt/module/hadoop-2.7.7/tmp</value>
        </property>
    </configuration>

#### $HADOOP_HOME/etc/hadoop/hdfs-site.xml
hdfs配置文件
    
    <configuration>
        <!-- secondary namenode 地址 -->
        <property> 
           <name>dfs.secondary.http.address</name>
           <value>hadoop-master:50090</value>
        </property>
        
        <!-- namenode数据保存位置 -->
        <property>
            <name>dfs.namenode.name.dir</name>
            <value>/home/hadoop/opt/module/hadoop-2.7.7/dfs/name</value>
        </property>
        
        <!-- datanode数据保存位置 -->
        <property>
            <name>dfs.datanode.data.dir</name>
            <value>/home/hadoop/opt/module/hadoop-2.7.7/dfs/data</value>
        </property>
        
        <!-- hdfs 数据备份数 -->
        <property>
            <name>dfs.replication</name>
            <value>3</value>
        </property>
        
        <!-- 使datanode跳过ip地址检查 防止通信错误 -->
        <property> 
            <name>dfs.namenode.datanode.registration.ip-hostname-check</name> 
            <value>false</value> 
        </property>
    </configuration>
#### 启动

##### hdfs
格式化namenode
    
    bin/hadoop namenode -format
   
启动
    
    sbin/start-dfs.sh

##### yarn (待补充)



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
    
    export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin

重载

    source /etc/profile

测试

    java -version
    hdfs -version
    
