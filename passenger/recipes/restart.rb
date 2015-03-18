bash 'Restart passenger' do
  only_if { (node[:passenger][:state] == "restart")}
  code <<-EOH
   cd #{node[:passenger][:clonelocation]}
    passenger stop  -p #{node[:passenger][:port]} > server.log 2>&1 &
    passenger start -p #{node[:passenger][:port]} --max-pool-size #{node[:passenger][:maxpoolsize]}  --min-instances #{node[:passenger][:mininstances]} --restart-dir tmp/ > server.log 2>&1 &
  EOH
end

