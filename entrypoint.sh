#!/bin/sh -l

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Making sure the script stops if any of the commands fails
set -eu

# Enable debug mode if RUNNER_DEBUG is 1
[ "${RUNNER_DEBUG:-0}" -eq 1 ] && set -x

# Authenticate with GitHub using the provided token
GITHUB_TOKEN=${1:-$GITHUB_TOKEN}
echo "$GITHUB_TOKEN" | gh auth login --with-token

# Mark the current directory as a safe directory for Git operations
git config --global --add safe.directory "$PWD"

# Setup variables
MASTER_BRANCH=${2:-"master"}
DEVELOP_BRANCH=${3:-"develop"}
FEATURE_PREFIX=${4:-"feature/"}
BUGFIX_PREFIX=${5:-"bugfix/"}
RELEASE_PREFIX=${6:-"release/"}
HOTFIX_PREFIX=${7:-"hotfix/"}

# Get the current branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# Function to check if a pull request already exists for the current branch
pull_request_exists() {
    EXISTS=$(gh pr list --head "$BRANCH_NAME" --state open | wc -l)
    [ "$EXISTS" -ne 0 ]
}

# Function to create pull request
create_pull_request() {
    BASE_BRANCH=$1
    PR_TITLE=$2
    # Replace '-' with ' ' in the title
    PR_TITLE=$(echo "$PR_TITLE" | sed 's/-/ /g')
    # Explanatory PR body message
    PR_BODY="This pull request has been automatically created by a script. It contains changes from the branch '${BRANCH_NAME}'. Please review the changes and merge them if appropriate."
    gh pr create --base "$BASE_BRANCH" --title "$PR_TITLE" --body "$PR_BODY"
}

# Check for branch pattern and create PR
if ! pull_request_exists; then
    case $BRANCH_NAME in
      "${FEATURE_PREFIX}"*)
        TITLE="feat: ${BRANCH_NAME#${FEATURE_PREFIX}}"
        create_pull_request "$DEVELOP_BRANCH" "$TITLE"
        ;;
      "${BUGFIX_PREFIX}"*)
        TITLE="fix: ${BRANCH_NAME#${BUGFIX_PREFIX}}"
        create_pull_request "$DEVELOP_BRANCH" "$TITLE"
        ;;
      "${RELEASE_PREFIX}"*)
        VERSION=${BRANCH_NAME#${RELEASE_PREFIX}}
        TITLE="chore(release): prepare for version $VERSION"
        create_pull_request "$MASTER_BRANCH" "$TITLE"
        ;;
      "${HOTFIX_PREFIX}"*)
        VERSION=${BRANCH_NAME#${HOTFIX_PREFIX}}
        TITLE="chore(release): prepare for version $VERSION"
        create_pull_request "$MASTER_BRANCH" "$TITLE"
        ;;
    esac
    printf "%bPull request created successfully for branch %s.%b\n" "$GREEN" "$BRANCH_NAME" "$NC"
else
    printf "%bPull request already exists for branch %s. Skipping PR creation.%b\n" "$RED" "$BRANCH_NAME" "$NC"
fi
