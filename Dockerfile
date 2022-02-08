FROM ruby:2.7.5

COPY . /sph-webhooks-example

RUN cd /sph-webhooks-example \
    && bundle install --without test development

EXPOSE 3000

ENTRYPOINT ["rails","s","-b","0.0.0.0"]
