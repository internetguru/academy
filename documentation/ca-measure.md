
# CA Measure

> This GitLab CI project downloads GitLab repositories and *measures for software similarities* using Moss script. It includes current project (on current branch) plus all repositories distributed from its individual branches using [CAD](https://github.com/InternetGuru/cad).

## GitLab CI Usage

1. Make sure you have your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token). On GitLab [set ACCESS_TOKEN variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) into your root namespace.

   - E.g. into `umiami/george`

1. Navigate into the project and switch to the branch you want to include into Moss. Make sure [the branch is protected](https://docs.gitlab.com/ee/user/project/protected_branches.html).

   - E.g. [umiami/george/csc220/matrix](https://gitlab.com/umiami/george/csc220/matrix)

1. Add the following lines into your `.gitlab-ci.yml`. Specify Moss location URL in `CAM_MOSS` variable. You may want to select a different `measure.sh` revision. Do not modify `CAM_REVISION` variable unless you know what you're doing.

    ```
    include: 'https://raw.githubusercontent.com/InternetGuru/cam/master/gitlab-measure.yml'

    variables:
      CAM_MOSSURL: ""
      CAM_REVISION: "1"

    stages:
      - measure
    ```

1. To execute coding assignment measure and obtain URL with Moss results [run **measure stage** CI manually](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually). You will find the URL with Moss results at the end of the pipeline output log.

## Suggestions

- [ ] Add BUTT tests.
- [ ] Specify branches to include/exclude.
- [ ] Modify source code location.
- [ ] Support other languages and extensions.
- [ ] Add GitHub support.

## Sources

- [Moss](https://theory.stanford.edu/~aiken/moss/)
- [Mossum: results visualization](https://github.com/hjalti/mossum)
- [How to cheat in computer science](https://github.com/genchang1234/How-to-cheat-in-computer-science-101)
