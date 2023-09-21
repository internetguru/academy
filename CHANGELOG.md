# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [1.0.0-rc.1] - 2023-09-19

### Added

- Function `check_x` to check and set executable flag.
- New function `get_artifacts_url` to generate links to logs.
- Update links with project ID during distribution in README files.
- User script support `{pre,post}-{collect,distribute}`.
- New variable `CHANGED_FILES` available for `evaluate` and `execute` scripts.
- New default execute file for Java `execute_java`.

### Changed

- Rename `badge_generate` function to `generate_badge`.
- Function `warning` simplified, returns zero status code.
- User script execution moved to a separate `function process_user_scripts`.
- Run IO tests and generate badges simplified and moved to a separate function `io_tests`.
- Run Java JUnit tests and generate badges simplified and moved to a separate function  `java_junit_tests`.
- Run Java code style and generate badges simplified and moved to a separate function  `java_code_style`.
- Execute file for shell `execute_shell` simplified.

### Removed

- Remove commands `academy collect` and `academy measure`.
- Function `check_lang` was removed.

## [0.5.4] - 2023-09-21

### Fixed

- Submit job commits .results by mistake.

## [0.5.3] - 2023-09-21

### Fixed

- Submit job is failing.

## [0.5.2] - 2023-08-06

### Fixed

- Academy execute job has wrong conditions.

## [0.5.1] - 2023-05-10

### Fixed

- Switching academy version in gitlab-ci include causes ci error.
- Distribute not working due to invalid variable.

### Added

- Add --force-merge param to distribute.

## [0.5.0] - 2023-05-02

_Stable release based on [0.5.0-rc.1]._

## [0.5.0-rc.1] - 2023-05-02

### Added

- Extened generate_badge function adding file, link and title params

## [0.4.0] - 2023-03-05
### Added
 - Change default prefix to project_name+ instead of project_name-

### Changed
 - Separate iotests to self-standing file

## [0.3.0] - 2022-09-22

## [0.2.0] - 2022-08-31

## [0.1.0] - 2022-06-06
### Added
 - Generate badges.txt artifact with all badges text representation
 - Create generated.txt file with timestamp
 - Set name of distributed project as `original_project_name user_name`


[Unreleased]: https://https://github.com/internetguru/academy/compare/staging...dev
[1.0.0-rc.1]: https://github.com/internetguru/academy/releases/tag/v0.5.2
[0.6.0-rc.1]: https://github.com/internetguru/academy/releases/tag/v0.5.2
[0.5.4]: https://https://github.com/internetguru/academy/compare/v0.5.3...v0.5.4
[0.5.3]: https://https://github.com/internetguru/academy/compare/v0.5.2...v0.5.3
[0.5.2]: https://https://github.com/internetguru/academy/compare/v0.5.1...v0.5.2
[0.5.1]: https://https://github.com/internetguru/academy/compare/v0.5.0...v0.5.1
[0.5.0]: https://https://github.com/internetguru/academy/compare/v0.4.0...v0.5.0
[0.5.0-rc.1]: https://github.com/internetguru/academy/releases/tag/v0.4.0
[0.4.0]: https://github.com/internetguru/academy/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/internetguru/academy/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/internetguru/academy/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/internetguru/academy/compare/v0.0.0...v0.1.0
