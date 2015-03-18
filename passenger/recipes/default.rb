#
# Cookbook Name:: passenger
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

git node[:passenger][:clonelocation] do
  repository node[:passenger][:repourl]
  revision "master"
  action :checkout
end

apt_package "ruby"+node[:passenger][:rubyversion] do
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


apt_package "ruby-dev" do
  action :install
end

apt_package "build-essential" do
  action :install
end

gem_package "passenger" do
  action :install
  gem_binary '/usr/bin/gem'+node[:passenger][:rubyversion]
end

gem_package "bundler" do
  action :install
end


directory node[:passenger][:clonelocation]+"/log" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end


