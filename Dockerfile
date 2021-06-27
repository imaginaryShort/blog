FROM ubuntu:20.04
LABEL maintainer="Yuki Takeda <yuki@imaginaryshort.com>"

ARG USER_NAME="ims"
ARG RUBY_VERSION="2.7.3"

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	git curl build-essential libssl-dev libreadline-dev zlib1g-dev

RUN useradd -m $USER_NAME
USER $USER_NAME
WORKDIR /home/$USER_NAME

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

ENV PATH /home/$USER_NAME/.rbenv/shims:/home/$USER_NAME/.rbenv/bin:$PATH

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
	~/.rbenv/bin/rbenv install $RUBY_VERSION && \
	~/.rbenv/bin/rbenv global $RUBY_VERSION

RUN ~/.rbenv/bin/rbenv exec gem install jekyll bundler

COPY Gemfile /home/$USER_NAME/Gemfile
COPY Gemfile.lock /home/$USER_NAME/Gemfile.lock
RUN bundle install

WORKDIR /home/$USER_NAME/jekyll
