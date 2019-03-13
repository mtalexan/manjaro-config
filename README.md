# manjaro-config
Contain Manjaro config files

Configuration files can be compared, or blindly symlinked by running the config_setup.sh script.

Add the following lines to the end of your .bashrc to get additional functionality.

```
MY_TOOLS_DIR=${HOME}/manjaro-config<br>
source ${MY_TOOLS_DIR}/all.incl<br>
```

Also remove "use_color" from the list of variables being unset after the PS1 pompt is set so the proper prompt will be used.
