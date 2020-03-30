sudo yum install wget

# java
sudo yum install java-1.8.0-openjdk-devel.x86_64

mkdir ~/Downloads

# scala
cd ~/Downloads && wget https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.tgz
cd ~/Downloads && tar -xf scala-2.11.12.tgz
sudo mv ~/Downloads/scala-2.11.12 /usr/lib/jvm/scala-2.11.12

# hadoop
cd ~/Downloads && wget http://apache.mirror.amaze.com.au/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
cd ~/Downloads && tar -xf hadoop-2.7.7.tar.gz
mkdir -p ~/opt/module
mv ~/Downloads/hadoop-2.7.7 ~/opt/module/hadoop-2.7.7

# spark
cd ~/Downloads && wget http://apache.mirror.amaze.com.au/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
cd ~/Downloads && tar -xf spark-2.4.5-bin-hadoop2.7.tgz
mv ~/Downloads/spark-2.4.5-bin-hadoop2.7 ~/opt/module/spark-2.4.5-bin-hadoop2.7

