set :stage, :production

server '45.55.38.186', user: 'deploy', roles: %w{web}, primary: true



role :app, %w{deploy@45.55.38.186}
role :web, %w{deploy@45.55.38.186}
role :db,  %w{deploy@45.55.38.186}



  ssh_options: {
    user: 'deploy', # overrides user setting above
    forward_agent: true,
    auth_methods: %w(password),
    password: '<deploy>'
  }
