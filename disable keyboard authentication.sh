#!/bin/bash
###############################################################################
# Disable Keyboard Authentication
# Isaac Ordonez, Mann Consulting, October R1
# Summary: Disables various methods of authentication in sshd_config so that
# the SSH process disables keyboard authentication 
#
#
# Arguments:
#		1-3 are reserved by JAMF's Casper Suite.
#
#	Exit Codes:
# 	0: Sucessful!
#	1: Generic Error, undefined
#
# Useage:
#	Use with a extension attribute that checks if keyboard input is
#   enabled so you're not blindly running commands on devices.
###############################################################################

sed -i '' "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sed -i '' "s/.*ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/g" /etc/ssh/sshd_config

if grep -v "ChallengeResponseAuthentication" /etc/ssh/sshd_config > /dev/null; then
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
fi

if grep -v "PasswordAuthentication" /etc/ssh/sshd_config > /dev/null; then
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
fi
