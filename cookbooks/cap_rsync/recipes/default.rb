%w(epel-release gcc-c++ git openssl-devel readline-devel zlib-devel).each do |pkg|
  package pkg
end

tmp_dir = Chef::Config['file_cache_path']
ruby_build_path = File.join tmp_dir, 'ruby-build'

git ruby_build_path do
  repository 'https://github.com/rbenv/ruby-build.git'
end

execute 'install ruby-build' do
  command "#{ruby_build_path}/install.sh"
end

ruby_version = '2.3.3'
ruby_path = "/opt/ruby-#{ruby_version}"

execute 'install ruby' do
  not_if  "test -d #{ruby_path}"
  command "/usr/local/bin/ruby-build #{ruby_version} #{ruby_path}"
end

link '/opt/ruby' do
  to ruby_path
end

%w(erb gem irb rake rdoc ri ruby).each do |cmd|
  link "/usr/bin/#{cmd}" do
    to "/opt/ruby/bin/#{cmd}"
  end
end

directory '/var/cap_rsync' do
  user  'vagrant'
  group 'vagrant'
  mode  '0755'
end

execute '/usr/bin/gem install bundler --no-ri --no-rdoc'

link '/usr/bin/bundle' do
  to '/opt/ruby/bin/bundle'
end
