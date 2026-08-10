#!/bin/bash

set -e

if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

COMMIT_MESSAGE="$(date '+%Y-%m-%d %H:%M:%S')"

git add .
git commit -m "$COMMIT_MESSAGE"
git push
