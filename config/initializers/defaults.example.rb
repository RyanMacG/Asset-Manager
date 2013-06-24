ENV['comp_logo'] = 'Company Name' #whatever you want the header logo to be
ENV['comp_title'] = 'Title' #whatever you want before the pipe in the title
ENV['asset_pre'] = 'IDENT' #whatever your company uses as a unique identifier before assets number
ENV['currency'] = 'GBP' #your local currency
ENV['comp_address_text'] = 'company name' #name of company/something else
ENV['comp_address'] = 'http://compintranet' #whatever company address is relevant
ENV['comp_email'] = 'mailto:example@example.com?subject=Issue%20with%20asset%20manager' #the email address of whoever is support this
ENV['support_name'] = 'John Bloggs' # the name of whoever/what department is responsible
ENV['token'] = '47c94dfe7cd376f3ff609e0e078c4a5aa485a93113284851ff3520ab9a1b981b64c86b5ba81e94a083a2a1166061881db05c1a6d905ebe89e43e9d7290fbd37e' #Refer to secret_token.rb for information
ENV['mail_server'] = 'mail_server.domain.co.uk' #address for your mail server
ENV['mail_port'] = 'server_port' #port for your mail server
ENV['mail_auth'] = 'auth_type' #auth type for mail server
ENV['deploy_server'] = '192.x.x.x' #ip of server being deployed to
ENV['deploy_user'] = 'deployment' #login you use for handling deployment
ENV['app_name'] = 'Asset-Manager' #Name of application (used by the git part of the deploy)
ENV['git_addr'] = 'git@github.com:RyanMacG/#{application}.git' #the address of your git repo