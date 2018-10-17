FROM circleci/android:api-27-node8-alpha

RUN locale-gen c.UTF-8
ENV LANG='c.UTF-8' LANGUAGE='c:en' LC_ALL='c.UTF-8'

USER root

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN apt-get update && \
    apt-get install -y ruby

#install fastlane
RUN gem install fastlane \
    && gem install bundler --no-ri --no-rdoc \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y && apt-get clean

USER circleci
