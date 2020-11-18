#!/bin/bash

cat >> /tmp/background.log <<EOF
$(/bin/date -Iseconds) - Executed intro background script.
EOF
