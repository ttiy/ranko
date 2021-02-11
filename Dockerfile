FROM amazonlinux:2

# Install any packages for development
RUN yum update -y \
	&& yum install -y \
		make gcc gcc-c++ ncurses-devel gdbm-devel db4-devel libffi-devel tk-devel libyaml-devel \
		expect libyaml libyaml-devel zlib zlib-devel readline readline-devel openssl openssl-devel \
		libxml2 libxml2-devel libxslt libxslt-devel file-devel glibc-common wget bind-utils git unzip bzip2 which libcurl-devel \
		ncurses-compat-libs libiconv graphviz epel-release python-pip

# LANG ENV
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"

# Ruby
#	https://github.com/feedforce/ruby-rpm
RUN rpm -ivh https://github.com/feedforce/ruby-rpm/releases/download/2.7.2/ruby-2.7.2-1.el7.centos.x86_64.rpm \
	&& gem install bundler -v 2.1.4

# NodeJS
#	https://github.com/nodesource/distributions
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash - \
	&& yum install -y nodejs \
	&& curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo \
	&& yum install -y yarn

# Install MySQL
RUN rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm \
	&& yum install -y mysql-community-client mysql-community-devel

# Setup app directory
RUN mkdir /app
WORKDIR /app

RUN bundle config build.nokogiri --use-system-libraries

# Set gem & bundler variables
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME"
ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV BUNDLE_APP_CONFIG="$GEM_HOME"
