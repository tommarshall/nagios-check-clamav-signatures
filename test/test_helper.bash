# !/usr/bin/env bash

load '../vendor/bats-mock/stub'

BASE_DIR=$(dirname $BATS_TEST_DIRNAME)
TMP_DIRECTORY=$(mktemp -d)

setup() {
  cd $TMP_DIRECTORY

  # setup local clamav lib dir for testing purposes
  mkdir -p var/lib/clamav
  cp $BASE_DIR/test/fixture/daily.cld var/lib/clamav/daily.cld
  cp $BASE_DIR/test/fixture/main.cvd var/lib/clamav/main.cvd

  # setup local state file dir for testing purposes
  mkdir -p var/lib/nagios
  touch var/lib/nagios/.check_clamav_signatures_ok
}

teardown() {
  unstub host

  if [ $BATS_TEST_COMPLETED ]; then
    echo "Deleting $TMP_DIRECTORY"
    rm -rf $TMP_DIRECTORY
  else
    echo "** Did not delete $TMP_DIRECTORY, as test failed **"
  fi

  cd $BATS_TEST_DIRNAME
}
