echo "$(date -Iseconds) - Executed intro foreground script."
# wait for background scripts to complete then show logs.
sleep 5
cat /tmp/background.log