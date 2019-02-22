#!/bin/bash
# Relies on i3-msg and jq

# Gets the next workspace number after the current highest.
# If the workspaces in use are 1,2,4, this will return 5.
# If the workspaces in use are 2,4, this will return 5.
# If the workspaces in use are 1,2,3,4, this will return 5.

#Gets the workspace list, strips the list wrapping syntax, prints just
#the numbers, sorts the results, and takes the last
CURRENT_HIGHEST=$(i3-msg -t get_workspaces | jq '.[].num' | sort | tail -n1)
echo "$(( ${CURRENT_HIGHEST} + 1 ))"
