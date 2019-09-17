# Base image
FROM ruby:2.6.4

# Setup environment variables that will be available to the instance
ENV APP_HOME /produciton

# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
      # Needed for certain gems
    build-essential \
         # Needed for postgres gem
    libpq-dev \
         # Needed for asset compilation
    nodejs \
    npm \
    # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add our Gemfile
# and install gems
RUN gem install bundler
ADD Gemfile* $APP_HOME/
RUN bundle install
RUN npm -g install yarn
RUN yarn install --check-files
# Copy over our application code
ADD . $APP_HOME

# Run our app
CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'
