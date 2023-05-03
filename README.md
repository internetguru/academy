
| branch  | status |
| :------------- | :------------- |
| master | [![tests badge at master](https://github.com/internetguru/academy/workflows/tests/badge.svg?branch=master)](https://github.com/internetguru/academy/actions?query=branch%3Amaster)|
| dev | [![tests badge at dev](https://github.com/internetguru/academy/workflows/tests/badge.svg?branch=dev)](https://github.com/internetguru/academy/actions?query=branch%3Adev)|

# Internet Guru Academy

> This script provides commands to manage coding assignments: _distribute_ among students, _evaluate_ individually, _collect_ all results, and _measure_ similarities.

## Requirements

- [Bash](https://www.gnu.org/software/bash/), version 3.2 and later
- [Git](https://git-scm.com/), version 1.8.0 and later
- [GNU getopt](http://frodo.looijaard.name/project/getopt)
  - On macOS install with Homebrew ([`gnu-getopt`](http://braumeister.org/formula/gnu-getopt)) or with [MacPorts](https://www.macports.org/) (`getopt`)
- [GNU sed](https://www.gnu.org/software/sed/)
  - On macOS install with Homebrew [`gnu-sed`](http://braumeister.org/formula/gnu-sed)
- [jq](https://stedolan.github.io/jq/)
  - On macOS install with Homebrew [`jq`](https://formulae.brew.sh/formula/jq)
- [go-md2man](https://github.com/cpuguy83/go-md2man), optional
  - On macOS install with Homebrew [`go-md2man`](https://formulae.brew.sh/formula/go-md2man)

## Installation

- To install locally, simply clone this project and set an alias.

   ```sh
   git clone https://github.com/internetguru/academy.git
   echo alias academy=\"$PWD/academy/academy\" >> ~/.bashrc
   source ~/.bashrc
   ```

- For global installation, clone this project into shared folder and create a symbolic link.

   ```sh
   sudo git clone https://github.com/internetguru/academy.git /usr/local/src
   sudo ln -s "/usr/local/src/academy/academy" /usr/local/share/academy
   ```

- To install `man` documentation, run the following script. (optional)
   ```sh
   sudo ./install-man.sh
   ```

## GitLab CI Integration

1. Make sure you have a personal access token available for the script, see `ACADEMY_GITLAB_ACCESS_TOKEN` in CI variables section below.

1. To integrate this script into your repository, add the following include statement to the `.gitlab-ci.yml` file directly or using a [GitLab variable](https://docs.gitlab.com/ee/ci/variables/#define-a-cicd-variable-in-the-ui) (recommended).

   - Create a variable within a selected scope and call it e.g. `ACADEMY_INCLUDE`. The recommended scope is the topmost GitLab namespace, as it can be overridden in specific scopes.
   - Value: 'https://raw.githubusercontent.com/internetguru/academy/${REVISION}/gitlab-stages.yml'
   - Replace `${REVISION}` with a version tag or a branch, e.g. `staging` or `prod-0`.
   - Insert the include statement in the `.gitlab-ci.yml`:

   ```yaml
   include:
     - $ACADEMY_INCLUDE
   ```

1. To include evaluation, specify `ACADEMY_LANG` and `ACADEMY_EVALUATE` variables. See below.

1. To display generated badges in `README.md`, see badges markdown in the meta job log.

## GitLab CI Variables

[GitLab CI variables](https://docs.gitlab.com/ee/ci/variables/#define-a-cicd-variable-in-the-ui) can be defined within the project's `.gitlab-ci.yml` file, in an arbitrary scope, or when running a specific job manually.

- `ACADEMY_DASHBOARD: "URL"`
   - Dashboard URL, e.g. https://academy.internetguru.io
- `ACADEMY_DEADLINE: "DATE"`
   - See `--deadline` option in `academy collect` documentation.
- `ACADEMY_EDITABLE: "PATTERN"`
   - See `--editable` option in `academy collect` documentation.
- `ACADEMY_EVALUATE: "WHEN"`
   - Integrate `academy evaluate` as `always` or `manual` (default) job.
- `ACADEMY_GITLAB_ACCESS_TOKEN: "ACCESS_TOKEN"` (\*secret)
   - See [how to generate your personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token).
- `ACADEMY_ISSUES: "LABEL"`
   - See `--process-issues` option in `academy distribute` documentation (default current branch).
- `ACADEMY_MOSSURL: "URL"` (\*secret)
   - CI accessible `URL` to download Moss script for `academy measure`.
- `ACADEMY_PREFIX: "PREFIX"`
   - Prepend PREFIX in front of each repository name. PREFIX is empty by default.
- `ACADEMY_SOLUTION: "BRANCH"`
   - Runs `academy collect` on the current project `BRANCH` and includes project from `BRANCH` among solutions to `academy measure` (default `master`).
- `ACADEMY_ASSIGN: "USERS"`
   - List of USERS, see stdin documentation of `academy collect`, `academy distribution`, and `academy measure` commands. If this variable is empty, reads USERS from `ACADEMY_ASSIGN` file if exists (which does not get distributed). Else current user is used by default. Values can be separated by white-spaces (e.g. space, tab, newline) or commas.

\* **Secret variables** should be defined as [masked environmental CI variables](https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project). Consider defining them globally for the whole group, e.g. in `internetguru/academy`.

## Technical Documentation

The following documentation files are available after installation using `man` command.

- [academy](documentation/academy.md)
- [academy distribute](documentation/academy-distribute.md)
- [academy evaluate](documentation/academy-evaluate.md)
- [academy collect](documentation/academy-collect.md)
- [academy measure](documentation/academy-measure.md)

## Licensing

All rights reserved.
