#!/bin/sh
#
# https://github.com/kcrawford/dockutil

brew install --cask hpedrorodrigues/tools/dockutil

dockutil --remove all

dockutil --add /Applications/kitty.app

dockutil --add /Applications/Todoist.app --after 'kitty'

dockutil --add /Applications/Slack.app --before 'kitty'

dockutil --add /Applications/Google\ Chrome.app --before 'Slack'

dockutil --add '~/Downloads' --view list --display folder

defaults write com.apple.dock tilesize -integer 36

killall Dock
