run_segment() {
  if [[ -z /Users/tbailey/fvm/default/bin/flutter ]]; then exit -1; fi
  version=$(flutter --version | awk -s '{ print $2; exit; }')
  echo "F: ${version}"
  exit 0;
}
