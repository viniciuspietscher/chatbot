FROM ruby:2.5-slim
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential libpq-dev git
ENV INSTALL_PATH /chatbot
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile ./
RUN bundle install
COPY . .
CMD rackup config.ru -o 0.0.0.0
