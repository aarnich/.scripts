#!/bin/bash
scripts_dir=$HOME/.scripts/
echo "what is the script called: "
read script_name
touch $scripts_dir/$script_name
chmod u+x $scripts_dir/$script_name

