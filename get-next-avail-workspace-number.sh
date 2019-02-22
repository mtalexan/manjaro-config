#!/bin/bash
# Relies on i3-msg and jq

# Gets the next available workspace number, looking for unused numbers less
# than the highest numbered workspace first.
# If the workspaces in use are 1,2,4, this will return 3.
# If the workspaces in use are 2,4, this will return 1.
# If the workspaces in use are 1,2,3,4, this will return 5.

#Gets the workspace list, strips the list wrapping syntax, prints just
#the numbers, sorts them, and put each one into an array
mapfile -t USED_LIST < <(i3-msg -t get_workspaces | jq '.[].num' | sort)

# track what we expect the next workspace number to be, starts at 1
EXPECTED=1

# indexing is 0 based
UPPER_LIMIT=$(( ${#USED_LIST[@]} - 1 ))

# iterate over the entries in the list
for i in $(seq 0 ${UPPER_LIMIT} ) ; do
    if [ ${USED_LIST[$i]} -ne ${EXPECTED} ] ; then
        # found the first missed number
        break
    else
        EXPECTED=$(( ${EXPECTED} + 1 ))
    fi
done

# if we finished the loop without breaking, this will be highest+1
echo "${EXPECTED}"
