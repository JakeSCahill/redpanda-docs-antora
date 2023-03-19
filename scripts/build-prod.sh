#!/bin/bash

# Set the CONSOLE_VERSION environment variable to the output of the getLatestConsoleVersion.js script
export CONSOLE_VERSION=$(node scripts/getLatestConsoleVersion.js);
echo $CONSOLE_VERSION;

# Set the REDPANDA_VERSION environment variable to the output of the getLatestRedpandaVersion.js script
export REDPANDA_VERSION=$(node scripts/getLatestRedpandaVersion.js);

# Split the REDPANDA variable into an array and set the REDPANDA_ARR environment variable to the array
export REDPANDA_ARR=(${REDPANDA_VERSION});
echo ${REDPANDA_ARR[0]};
echo ${REDPANDA_ARR[1]};

# Set the ALGOLIA_API_KEY, ALGOLIA_APP_ID, and ALGOLIA_INDEX_NAME environment variables
export ALGOLIA_API_KEY=2639b1b6c05670f52200b301c84866d9;
export ALGOLIA_APP_ID=6YUV7845VT;
export ALGOLIA_INDEX_NAME=redpanda;

# Set the attribute variable only if CONSOLE_VERSION and REDPANDA_ARR are not empty
if [[ -n "$CONSOLE_VERSION" && -n "${REDPANDA_ARR[0]}" && -n "${REDPANDA_ARR[1]}" ]]; then
  attribute="--attribute latest-console-verson=$CONSOLE_VERSION,latest-redpanda-version=${REDPANDA_ARR[0]},latest-redpanda-commit=${REDPANDA_ARR[1]}"
else
  attribute=""
fi

# Run the antora command with the attribute variable and the antora-playbook.yml file
antora --to-dir docs $attribute --fetch antora-playbook.yml
