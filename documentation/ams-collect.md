# AMS-COLLECT 1 2021-03-01 GNU "User Manuals"

## NAME

AMS-Collect - evaluate repositories against source tests

## SYNOPSIS

`ams collect` [`-hdenops`]

## DESCRIPTION

Downloads all repositories from a NAMESPACE matching given PREFIX. Runs `ams evaluate` on working project in `WORKING_DIR` replacing only editable files from individual solution repositories.

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
       From given NAMESPACE (below) add only projects with matching PREFIX (empty by default).

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

`ams`(1), `ams-distribute`(1), `ams-evaluate`(1), `ams-measure`(1)
