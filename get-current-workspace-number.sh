#!/bin/bash
# Relies on i3-msg and jq

# gets the workspaces, strips off the wrapping of the list syntax, finds
# the focused one, and returns the number
i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num'

