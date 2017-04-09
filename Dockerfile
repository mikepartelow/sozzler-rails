from ruby

# RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install -yq nodejs
RUN gem install rails

RUN mkdir -p /gem
WORKDIR /gem
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle

WORKDIR /opt/sozzler

EXPOSE 3000

