# ACADEMY-COLLECT 1 2021-03-01 GNU "User Manuals"

## NAME

Academy-Collect - evaluate repositories against source tests

## SYNOPSIS

`academy collect` [`-hdenops`]

## DESCRIPTION
Downloads repositories from a NAMESPACE/[PREFIX]USERNAME for each USERNAME from stdin. Runs `academy evaluate` on working project in `WORKING_DIR` replacing only editable files from downloaded repositories.

## OPTIONS

`-h`, `--help`
       Display usage.

`-d`, `--deadline DATE`
       Checkout each repository to the latest commit _pushed_ before DATE. DATE must be in ISO 8601 format, e.g. `2021-03-05` or `2021-03-05T00:41:21+00:00`. Uses latest existing commits by default.

`-e`, `--editable FILE...`
       In the source project, replace specific FILE(s) from each repository preserving other files that are not supposed to be edited. Default value is `src/main/*.java`.

`-n`, `--dry-run`
       Only process option validation. Would not proceed with cloning repositories and evaluation.

`-o`, `--output-dir DIR`
       Store collected repositories and results in DIR. Uses `mktemp` by default.

`-p`, `--prefix PREFIX`
       Prepend PREFIX in front of each repository name. PREFIX is empty by default.

`-s`, `--namespace NAMESPACE`
       Add projects from given NAMESPACE.

## EXIT STATUS

1      Other error.

2      Invalid options or arguments.

3      Remote namespace (group) not found.

## EXAMPLES

n/a

## BUGS

n/a

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`academy`(1), `academy-distribute`(1), `academy-evaluate`(1), `academy-measure`(1)