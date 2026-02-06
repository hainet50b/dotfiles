# homeos
homeos_home="${HOME}/.local/share/homeos"

homeos() {
  local default_repo="${homeos_home}/repos/default"

  if [ "$@" == 'cd' ]; then
    mkdir -p "$default_repo"
    (cd "$default_repo" && bash)
  elif [ "$@" == 'repo-path' ]; then
    echo "$default_repo"
  fi
}

