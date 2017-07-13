# Nagios check_clamav_signatures

[![Build Status](https://travis-ci.org/tommarshall/nagios-check-clamav-signatures.svg?branch=master)](https://travis-ci.org/tommarshall/nagios-check-clamav-signatures)

Nagios plugin to monitor ClamAV signatures are up to date.

## Installation

Install [ClamAV].

Download the [check_clamav_signatures] script and make it executable.

Define a new `command` in the Nagios config, e.g.

```nagios
define command {
    command_name    check_clamav_signatures
    command_line    $USER1$/check_clamav_signatures
}
```

## Usage

```
Usage: ./check_clamav_signatures [options]
```

### Examples

```sh
# exit OK if signatures up to date (or updated in the last 90 minutes), CRITICAL if outdated
./check_clamav_signatures

# exit OK if signatures up to date (or updated in the last 24 hours), CRITICAL if outdated
./check_clamav_signatures --expiry '1 day'
```

### Options

```
-e, --expiry <duration>      duration before the daily signatures are considered expired
-l, --clam-lib-path <dir>    path to ClamAV lib directory, default: $CLAM_LIB_DIR
-s, --state-file-path <dir>  path to state file directory, default: $STATE_FILE_DIR
-V, --version                output version
-h, --help                   output help information
```

* `-e`/`--expiry` should be a human readable duration, e.g. '1 hour', or '7 days'

## Dependencies

* Bash
* `cut`, `host`, `grep`, `sigtool`, `sed`

[ClamAV]: https://www.clamav.net/
[check_clamav_signatures]: https://cdn.rawgit.com/tommarshall/nagios-check-clamav-signatures/v0.1.0/check_clamav_signatures
