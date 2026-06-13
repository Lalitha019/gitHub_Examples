#!/bin/bash

################################
# Author: Lalitha Mahalakshmi Kollipara
# About: This script is used to get which users have access for the github repository using GET Request API
#
# Input: export/configure username and token
# Output: gets the list of users who is having the read only access
################################

# Function that is used to check if the user has given all the required parameters
helper()

# GitHub API URL
API_URL="https:api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Respository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
	local endpoint="$1"
	local url="${API_URL}/${end_point}"

	# Send a GET Request to the GitHub API with autentication
	curl -s -u "${USERNAME}:${TOKEN}" "$URL"
}

# Function to list users with read access to the repository
function list_users_with_read_access{
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	#Fetch the list of collaborators on the repository
	collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull ==true) | .login')"

	# Display the list of users with read access
	if [[ -z "$collaborators" ]]; then
		echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
		else
			echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
			echo "$collaborators"
	fi
}

function helper{
	expected_cmd_args=2
	if [ $# -ne $expected_cmd_args]; then
		echo "please execute the script with required cmd args"
		echo "repo owner and repo name"
	}
