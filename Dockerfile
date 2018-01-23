# FROM ruby:2.4.2-alpine3.7
FROM ruby@sha256:01768232842e9686435f59619e67107a9735cbed999df55b6a85de18f96ed6de

ADD .git .git

RUN ls -al .

CMD echo 1
