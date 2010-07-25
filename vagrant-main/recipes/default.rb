#require_recipe "mysql:server"
#require_recipe "rails"

link "/etc/nginx/sites-enabled/001-wren.conf" do
  to "/vagrant/config/nginx/dev.conf"
end

execute "install xml packages" do
  command "sudo apt-get -y install libxml2 libxml2-dev libxslt1-dev curl"
end

# restart nginx
# start node

# rake gems:install
# rake db:create db:migrate

#127.0.0.1       wren.dev
#127.0.0.1       blank.wren.dev
#127.0.0.1       www.wren.dev

