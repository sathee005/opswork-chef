
bash 'Stopping passenger' do
  only_if { !Dir.glob(node[:passenger][:clonelocation]+'/passenger.'+node[:passenger][:port]+'.pid').empty?  }
  code <<-EOH
   cd #{node[:passenger][:clonelocation]}
   passenger stop  -p #{node[:passenger][:port]} > server.log 2>&1 &
  EOH
end

