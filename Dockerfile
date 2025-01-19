FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN ssh-keygen -A

# RUN echo 'root:your_password' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
