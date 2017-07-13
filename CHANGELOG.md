# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added

* `-s`/`--state-file-path` for setting state file directory, default: `/var/lib/nagios`
* `-e/--expiry` option to set daily signatures expiry threshold duration.

### Changed

* Renamed `-p`/`--path` option to `-l`/`--clam-lib-path`.
* Daily signatures now only considered expired if it has been more than 90 minutes since they were last up to date.

## v0.1.0 - 2017-07-09

### Added

* Initial version.

[Unreleased]: https://github.com/tommarshall/nagios-check-clamav-signatures/compare/v0.1.0...HEAD
