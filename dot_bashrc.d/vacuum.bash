cvacuum() {
  docker container run --rm -it \
    -v "$PWD:/work:ro" \
    -w /work \
    dshanley/vacuum:latest "$@"
}

