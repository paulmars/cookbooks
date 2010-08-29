execute "link up manage" do
  command "ln -s /vagrant/config/nginx/dev.conf /etc/nginx/conf.d/manage.conf"
  command "sudo /etc/init.d/nginx restart"
end

execute "add gems" do
  cwd "/vagrant/manage/"
  command "sudo apt-get install libxml2-dev libxslt-dev"
  command "rake gems:install"
  command "touch tmp/restart.txt"
end

execute "setup database" do
  cwd "/vagrant/manage/"
  command "gem install rails --version=2.3.5"
  command "sudo apt-get install libsqlite3-dev; sudo gem install sqlite3-ruby"
  command "rake RAILS_ENV=development db:drop db:create db:migrate"  
end

# ln -s /vagrant/server/wren.vagrant.init.sh /etc/init.d/wren
# chmod 755 /etc/init.d/wren
# /etc/init.d/wren start
