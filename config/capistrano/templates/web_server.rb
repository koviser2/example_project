#!/bin/bash

RAILS_ENV="production"

app_user="<%= unicorn_user %>"
app_root="<%= current_path %>"

unicorn_pidfile="<%= unicorn_pid %>"
unicorn_config="<%= unicorn_config %>"

function get_unicorn_pid
{
  local pid=$(cat $unicorn_pidfile)
  if [ -z $pid ] ; then
    echo "Could not find a PID in $unicorn_pidfile"
    exit 1
  fi
  unicorn_pid=$pid
}

function start
{
  bundle exec unicorn_rails -D -c $unicorn_config -E $RAILS_ENV
}

function stop
{
  get_unicorn_pid
  kill -QUIT $unicorn_pid
}

function reload
{
  get_unicorn_pid
  kill -USR2 $unicorn_pid
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  reload)
    reload
    ;;
  *)
    echo "Usage: RAILS_ENV=your_env $0 {start|stop|reload}"
    ;;
esac
