
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

`ACADEMY_DEFAULT_DOCKER_IMAGE`
Docker image for academy jobs, e.g. the distribute job. Default value is `internetguru/academy:latest`.

`ACADEMY_DOCKER_IMAGE`
Docker image for the evaluate and execute jobs. Default value is `ACADEMY_DEFAULT_DOCKER_IMAGE`.

`ACADEMY_CACHE`
Caching directory used to share data between individual jobs and pipelines within a project. Default value is `../.academy-cache`.

`ACADEMY_EDITABLE`
List of files intended to be edited by users in distributed repositories. Files are separated by spaces and support [globbing](https://tldp.org/LDP/abs/html/globbingref.html), e.g. `image.png video.mp4 src/*.java`. Default value is `**/*`.

`ACADEMY_GITLAB_ACCESS_TOKEN`
[GitLab personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token) required for the API communication with `api` scope. It's recommended to use [Group Access Tokens](https://docs.gitlab.com/ee/user/group/settings/group_access_tokens.html). This **variable should be secret**, see [masked environmental CI variable](https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project).

`ACADEMY_ASSIGN`
List of users for the [`academy distribute` command](documentation/academy-distribute.md). If this variable is empty, `ACADEMY_ASSIGN` file is used instead (which does not get distributed). Users can be separated by white-spaces or commas.

`ACADEMY_DEADLINE` (not implemented)
Create a summary towards a specific date and time.

`ACADEMY_GROUP`
List of space-separated branches for the [`academy distribute` command](documentation/academy-distribute.md) to collect solutions instead of distributing to students. In the collect mode, no permissions are assigned and the `ACADEMY_ASSIGN` list is taken from specified groups.

`ACADEMY_EXECUTE`
Run the execute job automatically if the value is "always".

`ACADEMY_FORCE_JOB`
If this variable is “true”, run the evaluate job automatically regardless of other conditions.

`ACADEMY_EVALUATE`
Run the evaluate job automatically if the value is "always".

`ACADEMY_DASHBOARD`
Dashboard URL, e.g. https://academy.internetguru.io, used by the meta job to clear cache. Multiple URLs are supported separated by newlines.

`ACADEMY_ISSUES`
See the `--process-issues` option in the [`academy distribute` documentation](documentation/academy-distribute.md). Default value is the current branch.

`ACADEMY_LANG`
Determines which files are executed by the `evaluate` and `execute` jobs. There are several files being executed per each job in the following format: `{pre-,post-,}{evaluate,execute}_$ACADEMY_LANG`. Each of them can be overridden by a file of the same name in the `.academy` folder.

## Technical Documentation

The following documentation files are available after installation using `man` command.

- [academy](documentation/academy.md)
- [academy distribute](documentation/academy-distribute.md)
- [academy evaluate](documentation/academy-evaluate.md)
- [academy collect](documentation/academy-collect.md)
- [academy measure](documentation/academy-measure.md)

## Licensing

All rights reserved.
