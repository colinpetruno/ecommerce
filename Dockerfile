FROM ruby:2.2.0

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get  install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev nodejs

# for phantomjs
RUN apt-get install -y \
  chrpath \
  libssl-dev \
  libxft-dev \
  libfreetype6 \ 
  libfreetype6-dev \
  libfontconfig1 \
  libfontconfig1-dev

ENV PHANTOM_JS phantomjs-1.9.8-linux-x86_64

WORKDIR ~

RUN \
  wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
  tar xvjf $PHANTOM_JS.tar.bz2 && \
  mv $PHANTOM_JS /usr/local/share && \
  ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN apt-get install -y qt4-default

ENV APP_HOME /app/ecommerce
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install
RUN test -f $APP_HOME/tmp/pids/server.pid && rf $APP_HOME/tmp/pids/server.pid; true

ADD . $APP_HOME