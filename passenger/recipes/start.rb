bash 'Starting passenger' do
  only_if { Dir.glob(node[:passenger][:clonelocation]+'/passenger.'+node[:passenger][:port]+'.pid').empty? }
  code <<-EOH
   cd #{node[:passenger][:clonelocation]}
   passenger start -p #{node[:passenger][:port]} --max-pool-size #{node[:passenger][:maxpoolsize]}  --min-instances #{node[:passenger][:mininstances]} --restart-dir tmp/ > server.log 2>&1 &
  EOH
end
