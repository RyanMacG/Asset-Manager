namespace :nginx do
  desc "Install latest stable release of nginx"
  task :install do
    run "#{sudo} add-apt-repository ppa:nginx/stable"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install nginx"
  end
  after "deploy:install", "nginx:install"
  
  task :setup do
    desc "Setup nginx config for the app"
    template "nginx_unicorn.erb", "/tmp/nginx_conf"
    run "#{sudo} mv /tmp/nginx_conf /ect/nginx/sites-enabled/#{application}"
    run "#{sudo} rm -f /etc/sites-enabled/default"
    run "#{sudo} service nginx restart"
  end
  after "deploy:setup", "nginx:setup"
  
  %w[start stop restart].each do |command|
    desc "#{command} nginx."
    task command do
      run "#{sudo} service nginx #{command}"
    end
  end
end