#!/bin/sh
#
# https://github.com/kcrawford/dockutil

brew install --cask hpedrorodrigues/tools/dockutil

dockutil --remove all

dockutil --add /Applications/iTerm.app

dockutil --add /Applications/Todoist.app --after 'iTerm'

dockutil --add /Applications/Slack.app --before 'iTerm'

dockutil --add /Applications/Google\ Chrome.app --before 'Slack'

dockutil --add '~/Downloads' --view list --display folder 

defaults write com.apple.dock tilesize -integer 36

killall Dock
