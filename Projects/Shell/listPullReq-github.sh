
#!/bin/bash

############################################################
# Author: Swapnil
# Date: 11-07-2025
# Version: v1.0
# This script lists all pull requests for a given GitHub repository.
# Usage: ./listPullReq-github.sh <owner> <repo>
############################################################

# Function to display usage information
function Usage(){
    echo "Usage: ./listPullReq-github.sh <owner> <repo>"
    exit 1
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    Usage
fi

# Command line arguments
owner=$1
repo=$2

# GitHub username and personal access token that needs to be export as environment variables
USERNAME=$username
TOKEN=$token

# Complete URL for the GitHub API to list pull requests
api_URL="https://api.github.com/repos/$owner/$repo/pulls" 

# Function to get the URL for the GitHub API to list pull requests
getPullRequests(){
# -s for silent mode, -u for user authentication, -H for header
  curl -s -u "${username}:${token}" -H "Accept: application/vnd.github+json" $api_URL | jq -r '.[] | "PR no: \(.number)\nTitle: \(.title)\nUser: \(.user.login)\nURL: \(.html_url)\nState: \(.state)\n"'
  if [ $? -ne 0 ]; then
    echo "Error fetching pull requests. Please check your credentials or repository details."
    exit 1
  fi
  }
# Calling function to get pull requests
echo "The pull requests for the repository ${owner}/${repo} are:"
getPullRequests

