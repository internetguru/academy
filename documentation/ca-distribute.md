# CA-DISTRIBUTE 1 2021-02-14 GNU "User Manuals"

## NAME

CA-Distribute - distribute assignment among users

## SYNOPSIS

`ca distribute` [`-ahilnps`]

## DESCRIPTION

This script distributes files from WORKING_DIR into NAMESPACE/[PREFIX]USERNAME for each USERNAME from stdin.

## OPTIONS

`-a`, `--assign WHEN`
       Assign developer role to users for newly created projects and assign users to issues `always`, `never`, or according to account existence `auto` (default).

`-h`, `--help`
       Display usage.

`-i`, `--process-issues ISSUES_LABEL`
       Copy issues marked with `ISSUES_LABEL` label into destination repositories. `PROJECT_FOLDER` must be a GitLab project.

`-l`, `--update-links`
       Replace all occurrences of the assignment project's remote URL and its current branch with destination repository remote URL and its main branch in `README.md`. `PROJECT_FOLDER` must be a GitLab project.

`-n`, `--dry-run`
       Only process options and stdin validation. Would not proceed with create or update user repositories.

`-p`, `--prefix PREFIX`
       Prepend PREFIX in front of created repositories names. PREFIX is empty by default.

`-s`, `--namespace NAMESPACE`
       Distribute repositories into NAMESPACE instead of the current project's namespace.

## EXIT STATUS

1      Other error.

2      Invalid options or arguments including empty or missing stdin.

3      Some (or all) invalid users.

## EXAMPLES

```
echo "solver1 solver2 solver3" | ca distribute -l -p "lab01-" -s "umiami/george/csc220/spring21"
```

Given example distributes current directory into the following locations. The `-l` option updates links in README files.

```
umiami/george/csc220/spring21/lab01-solver1
umiami/george/csc220/spring21/lab01-solver2
umiami/george/csc220/spring21/lab01-solver3
```

The following example does the same job dynamically. Assuming you are in a `lab01` folder on branch `spring21`.

```
echo "solver1 solver2 solver3" | ca distribute -l -p "$(basename $PWD)-" -s "umiami/george/csc220/$(git rev-parse --abbrev-ref HEAD)"
```

Calling the command dynamically is a number one prevention from accidentally distributing a different lab or even a working solution to all solvers. Different branch would create a separate namespace and different (lab) folder would distribute the assignment into appropriate lab repositories.

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`ca-collect`(1), `ca-evaluate`(1), `ca-measure`(1)
