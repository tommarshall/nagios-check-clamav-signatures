#!/usr/bin/env bats

load '../vendor/bats-support/load'
load '../vendor/bats-assert/load'
load 'test_helper'

# Validation
# ------------------------------------------------------------------------------
@test "exits UNKNOWN if unrecognised option provided" {
  run $BASE_DIR/check_clamav_signatures --not-an-arg

  assert_failure 3
  assert_line "UNKNOWN: Unrecognised argument: --not-an-arg"
  assert_line --partial "Usage:"
}

# Defaults
#------------------------------------------------------------------------------

# --version
# ------------------------------------------------------------------------------
@test "--version prints the version" {
  run $BASE_DIR/check_clamav_signatures --version

  assert_success
  [[ "$output" == "check_clamav_signatures "?.?.? ]]
}

@test "-V is an alias for --version" {
  run $BASE_DIR/check_clamav_signatures -V

  assert_success
  [[ "$output" == "check_clamav_signatures "?.?.? ]]
}

# --help
# ------------------------------------------------------------------------------
@test "--help prints the usage" {
  run $BASE_DIR/check_clamav_signatures --help

  assert_success
  assert_line --partial "Usage: ./check_clamav_signatures"
}

@test "-h is an alias for --help" {
  run $BASE_DIR/check_clamav_signatures -h

  assert_success
  assert_line --partial "Usage: ./check_clamav_signatures"
}
