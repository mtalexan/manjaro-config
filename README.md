# manjaro-config
Contain Manjaro config files

Configuration files can be compared, or blindly symlinked by running the config_setup.sh script.

Add the following lines to the end of your .bashrc to get additional functionality.

```
export MY_TOOLS_DIR=${HOME}/manjaro-config
source ${MY_TOOLS_DIR}/all.incl
```

Also remove "use_color" from the list of variables being unset after the PS1 pompt is set so the proper prompt will be used.

# CUDA Tools
Install the optimus tools.  Then call the enableCUDA and disableCUDA.
