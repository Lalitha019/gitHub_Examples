# GitHub Collaborators Access Checker

This Bash script uses the GitHub REST API to retrieve collaborators of a repository and identify users with read access.

## Pre-requisites
- curl
- jq 
- GitHub Personal Access Token

## Usage
export username=<github_username>
export token=<personal_access_token>

## Execute with below command
./list-users.sh <repo-owner> <repo_name>

## Sample Output
Users with read access to Lalitha019/gitHub_Examples:
Lalitha019 [if we use jq filter]
sample-output-list-users [if we do not use jq filter]
