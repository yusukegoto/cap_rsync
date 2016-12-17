# README

This repository is for training for capistrano rsync.

using [bradrak/capistrano-rsync](https://github.com/Bladrak/capistrano-rsync).

## System dependencies

- Virtual Box
- Vagrant
- Ruby

## How to try

```bash
$ bundle install
$ vagrant plugin install vagrant-vbguest
$ vagrant up
$ ssh-agent $SHELL
$ ssh-add ./.vagrant/machines/default/virtualbox/private_key
$ cap staging deploy
```

After finishing, check it works on your browser with [http://192.168.33.10:3000](http://192.168.33.10:3000).
