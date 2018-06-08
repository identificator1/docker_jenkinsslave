FROM identificator/java8
MAINTAINER DG

RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y openssh-server \
    && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
    && mkdir -p /var/run/sshd \
    && adduser --quiet jenkins \
    && echo "jenkins:jenkins" | chpasswd \

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
