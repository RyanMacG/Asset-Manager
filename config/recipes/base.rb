def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}, __FILE__"))
  put ERB.new(erb).result(binding), to
end

namespace :deploy do
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
  end
end