FROM rails:4
MAINTAINER Yang Xiao <yangxiao@youmi.net>

RUN echo Asia/Shanghai > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

COPY . /team_dashboard
WORKDIR /team_dashboard

RUN sed -i "s/https:\/\/rubygems.org/https:\/\/ruby.taobao.org\//" Gemfile
RUN sed -i "s/json (1.8.1)/json (1.8.3)/" Gemfile.lock
RUN bundle install

EXPOSE 3000

ENTRYPOINT ["rails", "s", "-e", "production"]
