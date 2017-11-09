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
  wget "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -O gdrive
}

function fix_permission()
{
  ${SUDO} chown -R ${USER}:${USER} /home/${USER}/.gdrive
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

fix_permission

# Trigger fist use for configuration
gdrive list
