#!/bin/bash

set -e

GITHUB_ORG_NAME=$(echo $GITHUB_REPOSITORY | sed 's/\/.*//')
GITHUB_REPO_NAME=$(echo $GITHUB_REPOSITORY | sed 's/^.*\///')

if [ -n "$GITHUB_HEAD_REF" ]; then
  GITHUB_BRANCH_NAME=${GITHUB_HEAD_REF}
else
  GITHUB_BRANCH_NAME=${GITHUB_REF_NAME}
fi

if [ -z "$AWS_RESOURCE_IDENTIFIER" ]; then
  GITHUB_IDENTIFIER="${GITHUB_ORG_NAME}-${GITHUB_REPO_NAME}-${GITHUB_BRANCH_NAME}"
  GITHUB_IDENTIFIER="$($GITHUB_ACTION_PATH/operations/_scripts/generate/shorten_identifier.sh ${GITHUB_IDENTIFIER} 30)"
else
  GITHUB_IDENTIFIER="$($GITHUB_ACTION_PATH/operations/_scripts/generate/shorten_identifier.sh ${AWS_RESOURCE_IDENTIFIER} 30)"
fi
echo "$GITHUB_IDENTIFIER" | xargs