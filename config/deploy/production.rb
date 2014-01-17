set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deploy@bye-xp.cloudapp.net}
role :web, %w{deploy@bye-xp.cloudapp.net}
role :db,  %w{deploy@bye-xp.cloudapp.net}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'bye-xp.cloudapp.net', user: 'deploy', password: '1qaz2wsx', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :production)


desc "Create database.yml and asset packages for production"
before "deploy:finishing", :set_database do
	on roles( :app ), in: :sequence do
		db_config = "#{shared_path}/config/database.yml.production"
		#db_config = "#{db_config} #{release_path}/config/database.yml.production"
		execute :cp, "#{shared_path}/config/database.yml.production #{release_path}/config/database.yml"
		within current_path do
			execute :bundle, "install --deployment"
			execute :rake, "assets:precompile RAILS_ENV=production"
		end
	end
end
