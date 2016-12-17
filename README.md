# README

This repository is for training for capistrano rsync.

using [bradrak/capistrano-rsync](https://github.com/Bladrak/capistrano-rsync).

## System dependencies

- Virtual Box
- Vagrant
- Ruby

## Preparation

```bash
$ bundle install
$ vagrant up
$ ssh-agent $SHELL
$ ssh-add ./.vagrant/machines/default/virtualbox/private_key
$ cap staging deploy
```
