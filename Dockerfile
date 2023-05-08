FROM centos:latest
LABEL maintainer="Dmitry Konovalov konovalov.d.s@gmail.com"
RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN cd /etc/yum.repos.d
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN dnf install -y epel-release
RUN dnf -y install dnf-plugins-core
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf config-manager --set-enabled powertools 
RUN dnf install -y \
        python3 \
        python3-pip \
        nano \
        mc 
ENV LANG=ru_RU.UTF-8
ENV LC_ALL=ru_RU.UTF-8
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install -r requirements.txt
RUN dnf clean all 