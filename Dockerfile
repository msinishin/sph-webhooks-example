FROM ruby:2.7.5

COPY . /sph-webhooks-example

RUN cd /sph-webhooks-example \
    && bundle install --without test development

EXPOSE 3000

ENTRYPOINT ["bundle","exec","puma","-C","config/puma.rb","-t","1:2","-p","3000"]
