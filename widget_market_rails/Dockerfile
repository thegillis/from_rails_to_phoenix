FROM ruby:2.4

ARG BUNDLE_WITHOUT="development:test"

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
      libpq-dev libxslt-dev \
      nodejs postgresql-client-9.6 \
    && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /usr/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

# Bundler ENV var http://bundler.io/man/bundle-config.1.html.
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_WITHOUT=${BUNDLE_WITHOUT} \
    BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=4

RUN bundle config build.nokogiri --use-system-libraries && \
    bundle check || bundle install

COPY . $APP_HOME/

ENV PORT 3000
EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

CMD ["puma", "-C", "config/puma.rb"]
