FROM centos:7

# 更新系统
RUN yum -y update \
    && yum -y install wget

WORKDIR /usr/local/src

# 安装宝塔初始化
RUN yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh &&  echo y | sh install.sh

#设置entrypoint下持久化
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

EXPOSE 8888 888 21 20 443 80

HEALTHCHECK --interval=5s --timeout=3s CMD curl -fs http://localhost/ || exit 1