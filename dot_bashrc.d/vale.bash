cvale() {
  docker container run --rm \
    -v "$PWD:/docs:ro" \
    -w /docs \
    jdkato/vale:latest "$@"
}

