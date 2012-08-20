##Asset Manager

Currently this is only for my usage

If there are issues with the signup mailer blocking users run the following from deployment server using "cap delayed_job:start", ":stop" and ":restart" are also valid commands

To take the app down for maintenance run "cap deploy:web:disable" and to bring it back up run "cap deploy:web:enable"