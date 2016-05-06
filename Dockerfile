FROM kevinreedy/docker-chefdk:0.13.21

RUN apt-get install -y git
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

RUN curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P delivery-cli

RUN useradd --create-home dbuild
ADD . /opt/mysql
RUN chown -R dbuild:dbuild /opt/mysql
USER dbuild
WORKDIR /opt/mysql
