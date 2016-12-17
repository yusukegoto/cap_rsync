namespace :deploy do
  task :restart do
    on roles(:web) do |host|
      within release_path do
        execute 'pwd'
        execute "RAILS_ENV=#{fetch :stage} bundle exec pumactl stop  -P tmp/pids/puma.pid || true"
        execute "RAILS_ENV=#{fetch :stage} bundle exec pumactl start -P tmp/pids/puma.pid"
      end
    end
  end

  after :publishing, :restart
end
