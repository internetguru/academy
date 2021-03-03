# CA-COLLECT 1 2021-03-01 GNU "User Manuals"

## NAME

CA-Collect - evaluate repositories against source tests

## SYNOPSIS

`ca collect` [`-hidneps`]

## DESCRIPTION

Downloads all repositories from a NAMESPACE matching given PREFIX. Runs tests on WORKING_DIR replacing only EDITABLE files from individual repositories.

## OPTIONS

`-h`, `--help`
       Display usage.

`-d`, `--deadline DATE`
       TODO

`-e`, `--editable PATTERN`
       TODO

`-n`, `--dry-run`
       Only process option validation. Would not proceed with cloning repositories and evaluation.

`-o`, `--output DIR`
       TODO

`-p`, `--prefix PREFIX`
       From given NAMESPACE (below) add only projects with matching PREFIX (empty by default).

`-s`, `--namespace NAMESPACE`
       Add projects from given NAMESPACE. May contain multiple values separated by space. Process all branches in project's namespace if missing or empty.

## EXIT STATUS

1      Other error.

2      Invalid options or arguments.

3      Remote namespace (group) not found.

## EXAMPLES

n/a

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`ca`(1), `ca-distribute`(1), `ca-evaluate`(1), `ca-measure`(1)
