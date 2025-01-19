FROM ubuntu:latest

RUN apt update

RUN apt install vim

RUN apt install net-tools

RUN apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN ssh-keygen -A

RUN apt install ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
RUN \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update


# RUN echo 'root:your_password' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
