#
# Cookbook Name:: passenger
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

git "/home/ubuntu/check" do
  repository "https://github.com/opscode-cookbooks/php.git"
  revision "master"
  action :checkout
end

apt_package "ruby1.9.3" do
  action :install
end

apt_package "rubygems-integration" do
  action :install
end



apt_package "libmysqld-dev" do
  action :install
end

apt_package "emacs24-nox" do
  action :install
end

apt_package "ruby1.9.3" do
  action :install
end

gem_package "passenger" do
  action :install
  ignore_failure true
end

gem_package "bundler" do
  action :install
end

