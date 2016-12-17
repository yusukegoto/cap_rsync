namespace :deploy do
  task :restart do
    on roles(:web) do |host|
      pid_dir = 'tmp/pids'
      within release_path do
        with  rails_env: fetch(:stage) do
          test "[ -f #{pid_dir}/puma.pid ]" and execute *%W(bundle exec pumactl stop  -P #{pid_dir}/puma.pid)
          execute *%W(bundle exec puma)
        end
      end
    end
  end

  after :publishing, :restart
end
