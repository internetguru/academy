
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

## GitLab CI Usage

1. Make sure you have your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token). On GitLab [set ACCESS_TOKEN variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) into your root namespace.

   - E.g. into `internetguru/academy`

1. Navigate into the project and switch to the branch with assignment. Make sure [the branch is protected](https://docs.gitlab.com/ee/user/project/protected_branches.html).

   - E.g. [internetguru/academy/tutorial/java01-introduction@group1](https://gitlab.com/internetguru/academy/tutorial/java01-introduction/-/tree/group1)

1. To distribute the assignment to 3 test students, evaluate, collect and measure, add the following lines to your `.gitlab-ci.yml` file (create one if it doesn't exist).

   ```yaml
   include:
     - 'https://raw.githubusercontent.com/internetguru/academy/${REVISION}/gitlab-stages.yml'

   variables:
     ACADEMY_EVALUATE: "always"
     ACADEMY_USERS: "student1 student2 student3"
     ACADEMY_PREFIX: "java01-"
     ACADEMY_MOSSURL: "${MOSSURL}"
   ```

   - Replace `${REVISION}` with a version tag or a branch, e.g. `dev` or `master`.
   - Replace `${MOSSURL}` with where your moss script is located, e.g. `https://mydomain.com/moss`.
   - See more in GitLab CI Variables section (below).

1. The `academy evaluate` command runs automatically after each push. To execute other commands (`academy collect`, `academy distribute`, `academy measure`), [trigger their pipeline manually](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually). Make sure you trigger the pipeline on desired branch.

1. Display badges in `README.md` file with links to appropriate log files (evaluate process):

   ```markdown
   [![pipeline status](https://gitlab.com/${PROJECT}/badges/${BRANCH}/pipeline.svg)](https://gitlab.com/${PROJECT}/-/pipelines?ref=${BRANCH})
   [![compile](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/compile.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/compile.log?job=evaluate)
   [![checkstyle](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/checkstyle.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/checkstyle.log?job=evaluate)
   [![test](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/test.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/test.log?job=evaluate)
   ```

   - Replace `${PROJECT}` with your actual project's link, e.g. `internetguru/academy/tutorial/java01-introduction`.
   - Replace `${BRANCH}` with an actual branch, e.g. `master`.

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
