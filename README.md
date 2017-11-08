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
# exit OK if signatures up to date, CRITICAL if outdated
./check_clamav_signatures
```

### Options

```
-p, --path <path>           path to ClamAV lib directory, if not /var/lib/clamav
-V, --version               output version
-h, --help                  output help information
```

## Dependencies

* Bash
* `cut`, `host`, `grep`, `sigtool`, `sed`

## Development

To setup the project after cloning:

```
$ make setup
```

To run the tests:

```
$ make test
```

Tests are written with [Bats].

The majority of the tests are isolated, but `sigtool` is a required dependency, and network is required for the threshold expiry tests.

[Bats]: https://github.com/sstephenson/bats
[ClamAV]: https://www.clamav.net/
[check_clamav_signatures]: https://cdn.rawgit.com/tommarshall/nagios-check-clamav-signatures/v0.1.0/check_clamav_signatures
