# Java
java_dist='eclipse-temurin'
java_lts='25-jdk'

cjava() {
  local tag="${1:-$java_lts}"
  docker container run --rm -it \
    --mount type=bind,src=$PWD,dst=/workdir \
    -w /workdir \
    "$java_dist:$tag" \
    /bin/bash -lc 'java -version; echo; pwd; ls; echo; exec /bin/bash'
}

cjava_25() { cjava 25-jdk; }
cjava_21() { cjava 21-jdk; }

# JShell
cjshell() {
  local tag="${1:-$java_lts}"
  docker container run --rm -it $java_dist:$tag jshell
}

cjshell_25() { cjshell 25-jdk; }
cjshell_21() { cjshell 21-jdk; }

