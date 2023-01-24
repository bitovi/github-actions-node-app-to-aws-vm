#!/bin/bash

set -e

if [ -z "$AWS_RESOURCE_IDENTIFIER" ]; then
  GITHUB_IDENTIFIER="$(echo $($GITHUB_ACTION_PATH/operations/_scripts/generate/generate_identifier.sh) | tr '[:upper:]' '[:lower:]' | tr '_' '-' | tr '/' '-' )"
  GITHUB_IDENTIFIER="$($GITHUB_ACTION_PATH/operations/_scripts/generate/shorten_identifier.sh ${GITHUB_IDENTIFIER} 30)"
else
  GITHUB_IDENTIFIER="$AWS_RESOURCE_IDENTIFIER"
fi
echo "$GITHUB_IDENTIFIER" | xargs