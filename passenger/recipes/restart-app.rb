bash 'Restart App sd' do
  only_if { (node[:passenger][:state] == "restart-app")}
  code <<-EOH
   cd #{node[:passenger][:clonelocation]}
   passenger-config restart-app --name #{node[:passenger][:appname]} > restartapp.log 2>&1 & 
  EOH
end
