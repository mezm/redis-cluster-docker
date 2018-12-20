FROM redis:5

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq \
      net-tools ruby rubygems locales gettext-base wget && \
    apt-get clean -yqq

RUN gem install redis 

# Add startup script
COPY ./docker-data/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 7000 7001

ENTRYPOINT ["/docker-entrypoint.sh", "redis-cluster"]
