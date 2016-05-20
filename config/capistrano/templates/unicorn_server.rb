#!/bin/sh
### BEGIN INIT INFO
# Provides:          <%= application %>
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: <%= application %> management
# Description:       <%= application %> management
### END INIT INFO

### Environment variables
RAILS_ENV="production"

# Script variable names should be lower-case not to conflict with internal variables.
app_name="<%= application %>"
app_user="<%= unicorn_user %>"
app_root="<%= current_path %>"
pid_path="<%= dir_pids %>"
socket_path="<%= dir_pids %>"
web_server_sock_path="<%= unicorn_sock %>"
web_server_pid_path="<%= unicorn_pid %>"

# Switch to the app_user if it is not he/she who is running the script.
if [ "$USER" != "$app_user" ]; then
  sudo -u "$app_user" -H -i $0 "$@"; exit;
fi

# Switch to the app_root path, exit on failure.
if ! cd "$app_root" ; then
 echo "Failed to cd into $app_root, exiting!";  exit 1
fi


### Init Script functions

## Gets the pids from the files
check_pids(){
  if ! mkdir -p "$pid_path"; then
    echo "Could not create the path $pid_path needed to store the pids."
    exit 1
  fi
  # If there exists a file which should hold the value of the Unicorn pid: read it.
  if [ -f "$web_server_pid_path" ]; then
    wpid=$(cat "$web_server_pid_path")
  else
    wpid=0
  fi
}

## Called when we have started the two processes and are waiting for their pid files.
wait_for_pids(){
  i=0;
  while [ ! -f $web_server_pid_path ]; do
    sleep 0.1;
    i=$((i+1))
    if [ $((i%10)) = 0 ]; then
      echo -n "."
    elif [ $((i)) = 301 ]; then
      echo "Waited 30s for the processes to write their pids, something probably went wrong."
      exit 1;
    fi
  done
  echo
}

# We use the pids in so many parts of the script it makes sense to always check them.
# Only after start() is run should the pids change. Sidekiq sets it's own pid.
check_pids


## Checks whether the different parts of the service are already running or not.
check_status(){
  check_pids
  # If the web server is running kill -0 $wpid returns true, or rather 0.
  # Checks of *_status should only check for == 0 or != 0, never anything else.
  if [ $wpid -ne 0 ]; then
    kill -0 "$wpid" 2>/dev/null
    web_status="$?"
  else
    web_status="-1"
  fi

  if [ $web_status = 0 ]; then
    app_status=0
  else
    # http://refspecs.linuxbase.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/iniscrptact.html
    # code 3 means 'program is not running'
    app_status=3
  fi
}

## Check for stale pids and remove them if necessary.
check_stale_pids(){
  check_status
  # If there is a pid it is something else than 0, the service is running if
  # *_status is == 0.
  if [ "$wpid" != "0" -a "$web_status" != "0" ]; then
    echo "Removing stale Unicorn web server pid. This is most likely caused by the web server crashing the last time it ran."
    if ! rm "$web_server_pid_path"; then
      echo "Unable to remove stale pid, exiting."
      exit 1
    fi
  fi
}

## If no parts of the service is running, bail out.
exit_if_not_running(){
  check_stale_pids
  if [ "$web_status" != "0" ]; then
    echo "$app_name is not running."
    exit
  fi
}

## Starts Unicorn + Sidekiq if they're not running.
start() {
  check_stale_pids

  if [ "$web_status" != "0" ]; then
    echo -n "Starting the $app_name Unicorn"
  fi

  # Then check if the service is running. If it is: don't start again.
  if [ "$web_status" = "0" ]; then
    echo "The Unicorn web server already running with pid $wpid, not restarting."
  else
    # Remove old socket if it exists
    rm -f "$web_server_sock_path" 2>/dev/null
    # Start the web server
    RAILS_ENV=$RAILS_ENV bin/web start &
  fi

  # Wait for the pids to be planted
  wait_for_pids
  # Finally check the status to tell wether or not GitLab is running
  print_status
}

## Asks the Unicorn and the Sidekiq if they would be so kind as to stop, if not kills them.
stop() {
  exit_if_not_running

  if [ "$web_status" = "0" ]; then
    echo -n "Shutting down Unicorn"
  fi

  # If the Unicorn web server is running, tell it to stop;
  if [ "$web_status" = "0" ]; then
     RAILS_ENV=$RAILS_ENV bin/web stop
  fi

  # If something needs to be stopped, lets wait for it to stop. Never use SIGKILL in a script.
  while [ "$web_status" = "0" ]; do
    sleep 1
    check_status
    printf "."
    if [ "$web_status" != "0" ]; then
      printf "\n"
      break
    fi
  done

  sleep 1
  # Cleaning up unused pids
  rm "$web_server_pid_path" 2>/dev/null

  print_status
}

## Prints the status of app and it's components.
print_status() {
  check_status
  if [ "$web_status" != "0" ]; then
    echo "$app_name is not running."
    return
  fi
  if [ "$web_status" = "0" ]; then
      echo "The $app_name Unicorn web server with pid $wpid is running."
  else
      printf "The $app_name Unicorn web server is \033[31mnot running\033[0m.\n"
  fi
}

## Tells unicorn to reload it's config and Sidekiq to restart
reload(){
  exit_if_not_running
  if [ "$wpid" = "0" ];then
    echo "The $app_name Unicorn Web server is not running thus its configuration can't be reloaded."
    exit 1
  fi
  printf "Reloading $app_name Unicorn configuration... "
  RAILS_ENV=$RAILS_ENV bin/web reload
  echo "Done."

  wait_for_pids
  print_status
}

## Restarts Sidekiq and Unicorn.
restart(){
  check_status
  if [ "$web_status" = "0" ]; then
    stop
  fi
  start
}


### Finally the input handling.

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        restart
        ;;
  reload|force-reload)
        reload
        ;;
  status)
        print_status
        exit $app_status
        ;;
  *)
        echo "Usage: service $app_name {start|stop|restart|reload|status}"
        exit 1
        ;;
esac

exit