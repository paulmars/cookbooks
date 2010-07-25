#require_recipe "mysql:server"
#require_recipe "rails"

link "/etc/nginx/sites-enabled/001-wren.conf" do
  to "/vagrant/config/nginx/dev.conf"
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute "install xml packages" do
  command "sudo apt-get install libxml2 libxml2-dev libxslt1-dev"
end
