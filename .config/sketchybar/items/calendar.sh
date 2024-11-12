#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          update_freq=30 \
                          background.color=$LOVE_COLOR \
                          icon.color=$BASE_COLOR\
                          label.color=$BASE_COLOR\
                          script="$PLUGIN_DIR/calendar.sh" \

