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

`-i`, `--process-issues`
       Copy issues marked with 'assignment' label into destination repositories. `PROJECT_FOLDER` must be a GitLab project.

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

Given example distributes current directory into following locations. The `-l` option updates links in README files.

```
umiami/george/csc220/spring/lab01-solver1
umiami/george/csc220/spring/lab01-solver2
umiami/george/csc220/spring/lab01-solver3
```

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`ca-evaluate`(1), `ca-measure`(1)
