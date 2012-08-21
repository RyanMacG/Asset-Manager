##Asset Manager

Currently this is only for my usage

If there are issues with the signup mailer blocking users run the following from deployment server using "cap delayed_job:start", ":stop" and ":restart" are also valid commands

To take the app down for maintenance run "cap deploy:web:disable" and to bring it back up run "cap deploy:web:enable"

---
###Capistrano Commands
___
cap bundle:install             # Install the current Bundler environment.  
cap check:revision             # Make sure local git is in sync with remote.  
cap delayed_job:restart        # Restart the delayed_job process  
cap delayed_job:start          # Start the delayed_job process  
cap delayed_job:stop           # Stop the delayed_job process  
cap deploy                     # Deploys your project.  
cap deploy:assets:clean        # Run the asset clean rake task.  
cap deploy:assets:precompile   # Run the asset precompilation rake task.  
cap deploy:check               # Test deployment dependencies.  
cap deploy:cleanup             # Clean up old releases.  
cap deploy:cold                # Deploys and starts a 'cold' application.  
cap deploy:create_symlink      # Updates the symlink to the most recently deployed application  
cap deploy:install             # Install everything onto the server  
cap deploy:migrate             # Run the migrate rake task.  
cap deploy:migrations          # Deploy and run pending migrations.  
cap deploy:pending             # Displays the commits since your last deploy.  
cap deploy:pending:diff        # Displays the `diff' since your last deploy.  
cap deploy:rollback            # Rolls back to a previous version and restarts.  
cap deploy:rollback:code       # Rolls back to the previously deployed version.  
cap deploy:setup               # Prepares one or more servers for deployment.  
cap deploy:symlink             # Deprecated API.
cap deploy:update              # Copies your project and updates the symlink.  
cap deploy:update_code         # Copies your project to the remote servers.  
cap deploy:upload              # Copy files to the currently deployed version.  
cap deploy:web:disable         # Present a maintenance page to visitors.  
cap deploy:web:enable          # Makes the application web-accessible again.  
cap invoke                     # Invoke a single command on the remote servers.  
cap monit:install              # Install Monit  
cap monit:setup                # Setup all Monit configuration  
cap monit:nginx                # only setup nginx  
cap monit:postgresql           # only setup pgsql  
cap monit:unicorn              # only setup unicorn  
cap nginx:install              # Install latest stable release of nginx  
cap nginx:restart              # restart nginx  
cap nginx:setup                # Setup nginx configuration for this application  
cap nginx:start                # start nginx  
cap nginx:stop                 # stop nginx  
cap nodejs:install             # Install latest Node.js  
cap postgresql:create_database # Create a database for this application.  
cap postgresql:install         # Install the latest stable release of Postgres  
cap postgresql:setup           # Generate the database.yml configuration file.  
cap postgresql:symlink         # Symlink the database.yml file into latest release  
cap rbenv:install              # Install rbenv, Ruby, and bundle  
cap shell                      # Begin an interactive Capistrano session.  
cap unicorn:restart            # restart unicorn  
cap unicorn:setup              # Setup Unicorn initializer and app configuration  
cap unicorn:start              # start unicorn  
cap unicorn:stop               # stop unicorn