namespace :nginx do
  task :install do
    run "#{sudo} add-apt-repository ppa:nginx/stable"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install nginx"
  end
  after "deploy:install", "nginx:install"
  
  task :setup do
    template "nginx_unicorn.erb", "/tmp/nginx_conf"
    run "#{sudo} mv /tmp/nginx_conf /ect/nginx/sites-enabled/#{application}"
    run "#{sudo} rm -f /etc/sites-enabled/default"
    run "#{sudo} service nginx restart"
  end
  after "deploy:setup", "nginx:setup"
  
  %w[start stop restart].each do |command|
    task command do
      run "#{sudo} service nginx #{command}"
    end
  end
end