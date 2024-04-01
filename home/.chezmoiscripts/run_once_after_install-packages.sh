#!/usr/bin/env bash
#
# prelude 
#
#
set -e

echo ">>> Emacs"
if test $(which emacs)
then
    # downloading 
    echo "Downloading Prelude"
    wget --no-check-certificate https://github.com/bbatsov/prelude/raw/master/utils/installer.sh -O - | sh
else
    echo "Emacs not installed"
fi
