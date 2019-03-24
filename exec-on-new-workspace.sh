#!/bin/bash

# Runs the command provided here as part of a quoted exec call in i3
# on an unused workspace.  Switches to the workspace automatically.

SOURCE_DIR=$(dirname $(realpath -e "$0"))

# since we're going to stay on that workspace, it's fine to create the
# workspace in the middle of existing ones rather than always putting
# it as a new highest number
NEW_WORKSPACE_NUMBER=$(${SOURCE_DIR}/get-next-avail-workspace-number.sh | tr -d '[[:space:]]')

# jump to the new workspace, and run the command
i3-msg "workspace ${NEW_WORKSPACE_NUMBER} ; exec --no-startup-id \"$@\"" &>/dev/null
