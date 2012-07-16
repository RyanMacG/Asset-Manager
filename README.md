##Asset Manager

Currently this is only for my usage

To stop the mailer blocking user interaction during signup make sure that when the app is started on the server the command "script/delayed_jobs start" is run from the applications root directory.

Alternitavely it can be run from the deployment server using cap delayed_job:start, :stop and :restart are also valid commands
