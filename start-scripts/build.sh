#!/bin/bash

# Get the latest Redpanda Console version
export CONSOLE_VERSION=$(node start-scripts/getLatestConsoleVersion.js);

# Set the ALGOLIA environment variables
export ALGOLIA_API_KEY=2639b1b6c05670f52200b301c84866d9;
export ALGOLIA_APP_ID=6YUV7845VT;
export ALGOLIA_INDEX_NAME=redpanda;

# Set the latest-console-version attribute
if [[ -n "$CONSOLE_VERSION" ]]; then
  attribute="--attribute latest-console-version=$CONSOLE_VERSION"
else
  attribute=""
fi

# Build the site
antora --to-dir docs $attribute --fetch antora-playbook.yml
