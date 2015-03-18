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

directory node[:passenger][:clonelocation]+"/tmp" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

bash 'Starting passenger' do
  only_if { Dir.glob(node[:passenger][:clonelocation]+'/passenger.'+node[:passenger][:port]+'.pid').empty? }
  code <<-EOH
   cd #{node[:passenger][:clonelocation]}
   passenger start -p #{node[:passenger][:port]} --max-pool-size #{node[:passenger][:maxpoolsize]}  --min-instances #{node[:passenger][:mininstances]} --restart-dir tmp/ > server.log 2>&1 &
  EOH
end
