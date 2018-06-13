#!/bin/bash
mv configi3 ~/.i3/config
mv config /etc/xdg/termite/config

if [ $@ -eq 0]; then
  echo "Finish the installation"
fi
