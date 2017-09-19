#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  SUDO="sudo"
else
  SUDO=""
fi

function not_ubuntu()
{
  check_ubuntu=$(cat /etc/lsb-release | grep Ubuntu -c)
  if [ "${check_ubuntu}" == "0" ]; then
    return 0
  fi

  return 1
}

function dl_gdrive()
{
  gdrive_url="https://doc-08-48-docs.googleusercontent.com/docs/securesc/"
  gdrive_url="${gdrive_url}ha0ro937gcuc7l7deffksulhg5h7mbp1/"
  gdrive_url="${gdrive_url}7qpkkmtqcrc8anpu68fue1hli6u4t19a/1505433600000/"
  gdrive_url="${gdrive_url}15876260727594163214/*/"
  gdrive_url="${gdrive_url}0B3X9GlR6EmbnQ0FtZmJJUXEyRTA?e=download"

  curl "${gdrive_url}" -o gdrive
  if [ $? -ne 0 ]; then
    wget "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -O gdrive
  fi
}

function install()
{
  chmod +x gdrive gdsync
  ${SUDO} cp gdrive /usr/local/bin/gdrive
  ${SUDO} cp gdsync /usr/local/bin/gdsync
}

if not_ubuntu; then
  echo -e "You should install gdrive to /usr/local/bin/gdrive first."
  echo -e "Please go to https://github.com/prasmussen/gdrive"
  echo -e
  exit 1
fi

dl_gdrive

install

# Trigger fist use for configuration
gdrive list
