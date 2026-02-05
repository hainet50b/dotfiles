# homeos
homeos_home="${HOME}/.local/share/homeos"

homeos() {
  if [ "$@" == 'cd' ]; then
    local default_repo="${homeos_home}/repos/default"

    mkdir -p "$default_repo"
    (cd "$default_repo" && bash)
  fi
}

