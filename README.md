
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
   sudo ./install.sh
   ```

## GitLab CI Integration

> **Important:** Make sure you have a [custom variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) `GITLAB_ACCESS_TOKEN` with your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token) in your root namespace, e.g. in `internetguru/academy`.

1. For the working solution on a master branch, add the following include statement to the `.gitlab-ci.yml` file. Create the file if it doesn't exist. 

   ```yaml
   include:
     - 'https://raw.githubusercontent.com/internetguru/academy/${REVISION}/gitlab-stages.yml'
   ```

   - Replace `${REVISION}` with a version tag or a branch, e.g. `dev` or `master`.
   - E.g. [internetguru/academy/tutorial/java01-introduction/.gitlab-ci.yml](https://gitlab.com/internetguru/academy/tutorial/java01-introduction/-/blob/master/.gitlab-ci.yml)
   - E.g. [internetguru/academy/tutorial/java02-matrix/.gitlab-ci.yml](https://gitlab.com/internetguru/academy/tutorial/java02-matrix/-/blob/master/.gitlab-ci.yml)
   - See more in GitLab CI Variables section (below).

1. Similarly for the branch with the assignment. Add a list of students for distribute and collect commands.

   ```yaml
   include:
     - 'https://raw.githubusercontent.com/internetguru/academy/${REVISION}/gitlab-stages.yml'

   variables:
     ACADEMY_USERS: "student1 student2 student3"
   ```

   - Replace `${REVISION}` with a version tag or a branch, e.g. `dev` or `master`.
   - E.g. [internetguru/academy/tutorial/java01-introduction/.gitlab-ci.yml@group1](https://gitlab.com/internetguru/academy/tutorial/java01-introduction/-/blob/group1/.gitlab-ci.yml)
   - E.g. [internetguru/academy/tutorial/java02-matrix/.gitlab-ci.yml@group1](https://gitlab.com/internetguru/academy/tutorial/java02-matrix/-/blob/group1/.gitlab-ci.yml)
   - See more in GitLab CI Variables section (below).

1. For either working solution and the assignment, display badges in `README.md` file with links to appropriate log files:

   ```markdown
   [![pipeline status](https://gitlab.com/${PROJECT}/badges/${BRANCH}/pipeline.svg)](https://gitlab.com/${PROJECT}/-/pipelines?ref=${BRANCH})
   [![compile](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/compile.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/compile.log?job=evaluate)
   [![checkstyle](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/checkstyle.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/checkstyle.log?job=evaluate)
   [![test](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/test.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/test.log?job=evaluate)
   [![iotest](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/iotest.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/iotest.log?job=evaluate)
   ```

   - Replace `${PROJECT}` with your actual project's link, e.g. `internetguru/academy/tutorial/java01-introduction`.
   - Replace `${BRANCH}` with an actual branch, e.g. `master`.
   - E.g. [internetguru/academy/tutorial/java01-introduction/README.md](https://gitlab.com/internetguru/academy/tutorial/java01-introduction/-/blob/master/README.md)
   - E.g. [internetguru/academy/tutorial/java01-introduction/README.md@group1](https://gitlab.com/internetguru/academy/tutorial/java01-introduction/-/blob/group1/README.md)
   - E.g. [internetguru/academy/tutorial/java02-matrix/README.md](https://gitlab.com/internetguru/academy/tutorial/java02-matrix/-/blob/master/README.md)
   - E.g. [internetguru/academy/tutorial/java02-matrix/README.md@group1](https://gitlab.com/internetguru/academy/tutorial/java02-matrix/-/blob/group1/README.md)

Note: To execute individual commands, [trigger their pipeline](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually). Make sure you trigger the pipeline on desired branch.

## GitLab CI Variables

- `ACADEMY_DEADLINE: "DATE"`
   - See `--deadline` option in `academy collect` documentation.
- `ACADEMY_EDITABLE: "PATTERN"`
   - See `--editable` option in `academy collect` documentation.
- `ACADEMY_EVALUATE: "WHEN"`
   - Integrate `academy evaluate` as `always` or `manual` (default) job.
- `ACADEMY_ISSUES: "LABEL"`
   - See `--process-issues` option in `academy distribute` documentation (default current branch).
- `ACADEMY_MOSSURL: "URL"`
   - CI accessible `URL` to download Moss script for `academy measure`.
- `ACADEMY_PREFIX: "PREFIX"`
   - Prepend PREFIX in front of each repository name. PREFIX is empty by default.
- `ACADEMY_SOLUTION: "BRANCH"`
   - Runs `academy collect` on the current project `BRANCH` and includes project from `BRANCH` among solutions to `academy measure` (default `master`).
- `ACADEMY_USERS: "USERS"`
   - List of USERS, see stdin documentation of `academy collect`, `academy distribution`, and `academy measure` commands. If this variable is empty, reads USERS from `ACADEMY_USERS` file if exists (which does not get distributed). Else current user is used by default. Values can be separated by white-spaces (e.g. space, tab, newline) or commas.

## Licensing

All rights reserved.
