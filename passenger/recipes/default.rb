passenger_state = node[:passenger][:state].include? "configure"
include_recipe "passenger::configure"  if passenger_state

passenger_state = node[:passenger][:state].include? "start"
include_recipe "passenger::start"  if passenger_state

passenger_state = node[:passenger][:state].include? "stop"
include_recipe "passenger::stop"  if passenger_state

passenger_state = node[:passenger][:state].include? "restart"
include_recipe "passenger::restart"  if passenger_state

passenger_state = node[:passenger][:state].include? "restart-app"
include_recipe "passenger::restart-app"  if passenger_state

