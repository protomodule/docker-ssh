#!/usr/bin/env bash
set -Eeo pipefail
trap cleanup ERR
cleanup() {
  if [[ -z ${QUIET+x} ]]; then
    echo
    echo "                💥"
    echo "   ---  Something went wrong!   ---   " | lolcat -i
  fi
}

trap help SIGINT
help() {
  trap - ERR
  if [[ -z ${QUIET+x} ]]; then
    echo
    echo "                      🆘"
    echo "          ---  Do you need help?   ---   " | lolcat
    echo "Visit https://github.com/protomodule/docker-ssh-client" | lolcat
  fi
}

if [[ -z ${QUIET+x} ]]; then
  figlet -f slant "Protomodule" | lolcat
  echo "                  S S H   C l i e n t   $(cat /etc/alpine-release)" | lolcat
  echo
  echo
  ssh -V
fi

if [[ ! -z $SSH_PRIVATE_KEY ]]; then
  echo
  echo "🔑  Starting SSH agent & adding key..."
  eval $(ssh-agent -s)
  echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -

  echo
  echo "🔐  Known keys:"
  ssh-add -l
fi

if [[ ! -z $KNOWN_HOST ]]; then
  echo
  echo "👆  Adding fingerprint of $KNOWN_HOST to known hosts..."
  mkdir -p ~/.ssh
  ssh-keyscan -H -p${KNOWN_PORT:-22} $KNOWN_HOST >> ~/.ssh/known_hosts
fi

if command -v $1 &> /dev/null; then
  echo
  echo "🌈  Running command $1 ..." | lolcat
  $1 ${@:2}
else
  echo
  echo "🔌  Starting SSH connection..."
  ssh $@
fi

echo
echo "👋  Bye" | lolcat
