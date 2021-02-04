#!/bin/bash

# globals
SCRIPT_NAME="$(basename "$0")"
GITLAB_URL="https://gitlab.com"
PROJECTS_FOLDER="projects"
TOKEN="$1"
CAM_LANG="java"

exception() {
  echo "EXCEPTION: ${1:-$SCRIPT_NAME Exception}" >&2
  exit "${2:-1}"
}
get_project_origin_url() {
  echo "https://oauth2:$TOKEN@gitlab.com/${1:-}.git"
}
get_group_id() {
  curl -s --header "Authorization: Bearer $TOKEN" "$GITLAB_URL/api/v4/groups" \
    | jq -r --arg group_name "${1:-}" '.[] | select(.full_path==$group_name) | .id'
}
get_group_projects() {
  curl -s --header "Authorization: Bearer $TOKEN" "$GITLAB_URL/api/v4/groups/${1:-}/projects" \
    | jq -r '.[] | .name_with_namespace' | tr -d " "
}

mkdir "$PROJECTS_FOLDER"
project_namespace="$(dirname "$PWD" | cut -d/ -f3-)"
project_name="$(basename "$PWD")"
# get all branches
git fetch --all >/dev/null

# for all branches get user projects
for branch in $(git branch -r | grep -v '\->'); do
  namespace="$project_namespace/$(basename "$branch")/$project_name"
  # get namespace id
  group_id="$(get_group_id "$namespace")" \
    || exception "API error"
  [[ -z "$group_id" ]] \
    && continue
  projects="$(get_group_projects "$group_id")" \
    || exception "API error"
  # clone all projects from ns
  for project in $projects; do
    mkdir -p "$PROJECTS_FOLDER/$project"
    git clone -q "$(get_project_origin_url "$project")" "$PROJECTS_FOLDER/$project" \
      || exception "Unable to clone project $project from $namespace"
  done
done

# allow **/*
shopt -s globstar

# send projects into moss
./moss -l "$CAM_LANG" -d "$PROJECTS_FOLDER"/**/src/main/**/*."$CAM_LANG" src/main/**/*."$CAM_LANG"
