#!/usr/bin/env bash

GITHUB_API_URI="https://api.github.com"
GITHUB_API_HEADER="Accept: application/vnd.github.v3+json"

github::create_pr(){
  base_branch="$1"
  head="$2"
  title="$3"
  data="{\"title\":\"${title}\",\"base\":\"${base_branch}\",\"head\": \"${head}\"}"
  response=$(curl -sSL -H "$GITHUB_API_HEADER" -H "Authorization: token ${GITHUB_TOKEN}" "$GITHUB_API_URI/repos/$GITHUB_REPOSITORY/pulls" -d "$data")
  echo "${response}"
}