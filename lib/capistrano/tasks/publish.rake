namespace :deploy do
  task :restart do
    on roles(:web) do |host|
      pid_path = 'tmp/pids/puma.pid'

      within release_path do
        with  rails_env: fetch(:stage) do
          test "[ -f #{pid_path} ]" and execute *%W(bundle exec pumactl stop -P #{pid_path}/puma.pid)
          execute *%W(bundle exec puma)
        end
      end
    end
  end

  after :publishing, :restart
end
