# Maven
mvn_java_lts='3-eclipse-temurin-25'

# NOTE:
# Maven options must be passed after '--'
# e.g. cmvn -- -DskipTests clean package
cmvn() {
  local tag=$mvn_java_lts port=''

  local OPTIND
  while getopts ':p:t:' opt; do
    case $opt in
      p) port=$OPTARG ;;
      t) tag=$OPTARG ;;
    esac
  done
  shift $((OPTIND - 1))

  local -a port_option=()
  if [[ -n $port ]]; then
    port_option=(-p "$port:$port")
  fi

  docker container run --rm -it \
    --mount type=bind,src=$PWD,dst=/workdir \
    -w /workdir \
    --mount type=volume,src=dot_m2,dst=/root/.m2 \
    "${port_option[@]}" \
    maven:$tag \
    /bin/bash -lc '
      mvn -v
      echo
      pwd
      ls
      echo
      if [ "$#" -gt 0 ]; then
        exec mvn "$@"
      else
        exec /bin/bash
      fi
    ' -- "$@"
}

cmvn_25() { cmvn -t 3-eclipse-temurin-25 "$@"; }
cmvn_21() { cmvn -t 3-eclipse-temurin-21 "$@"; }

