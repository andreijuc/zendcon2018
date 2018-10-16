FROM ubuntu:18.04

#Install some dependencies
RUN apt-get update; apt-get install -y fortune cowsay

#Make a home directory and add a dummy user
RUN mkdir -p /home/dummy_user; useradd -d /home/dummy_user -s /bin/bash dummy_user;

#Make a workspace directory and make sure anyone can write to it
RUN mkdir -p /workspace; chmod -R 777 /workspace

#Switch to dummy user
USER dummy_user

ENV PATH=/usr/games/:$PATH

ENTRYPOINT ["bash", "-c"]
CMD ["fortune /usr/share/games/fortunes/literature | cowsay"]
