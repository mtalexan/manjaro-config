#!/bin/bash

# Runs the command provided here as part of a quoted exec call in i3
# on a new highest numbered workspace and sends a notification about it.
# Does NOT switch to the workspace it was run on.

SOURCE_DIR=$(dirname $(realpath -e "$0"))

# Since we are starting this in the background on a new workspace,
# keep it easy to find which workspace it was put on by putting it
# on a new highest numbered workspace
NEW_WORKSPACE_NUMBER=$(${SOURCE_DIR}/get-next-workspace-number.sh | tr -d '[[:space:]]')
CURRENT_WORKSPACE_NUMBER=$(${SOURCE_DIR}/get-current-workspace-number.sh | tr -d '[[:space:]]')

# jump to the new workspace, run the command, come back to this workspace, and print a notification
i3-msg "workspace ${NEW_WORKSPACE_NUMBER} ; exec --no-startup-id \"$@\" ; workspace ${CURRENT_WORKSPACE_NUMBER}; exec --no-startup-id notify-send \"${NEW_WORKSPACE_NUMBER} : $@\"" &>/dev/null
