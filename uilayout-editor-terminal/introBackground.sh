#!/bin/bash

mkdir -p /root/test
cat >> /root/test/background.log <<EOF
$(/bin/date -Iseconds) - Executed intro background script.
EOF
