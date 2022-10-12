FROM debian:buster-slim

RUN apt update && apt install -y gnupg2
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee -a /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 93C4A3FD7BB9C367
RUN apt update
RUN apt upgrade  -y

RUN apt install zsh yadm git wget ansible -y
RUN yadm clone https://github.com/marksie1988/dotfiles.git

CMD ["zsh"]
