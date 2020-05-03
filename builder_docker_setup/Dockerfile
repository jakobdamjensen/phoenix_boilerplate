FROM ubuntu:18.04 as build
RUN apt-get clean
RUN apt-get update
RUN apt-get install wget --assume-yes
RUN apt-get install gnupg --assume-yes

RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
RUN dpkg -i erlang-solutions_2.0_all.deb

RUN apt-get update
RUN apt-get install curl --assume-yes
RUN apt-get install esl-erlang --assume-yes
RUN apt-get install elixir --assume-yes


RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh


RUN apt-get install nodejs python --assume-yes

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install yarn --assume-yes

