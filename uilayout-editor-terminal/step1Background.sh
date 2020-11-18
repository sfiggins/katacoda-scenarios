#!/bin/bash

cat >> /tmp/background.log <<EOF
$(/bin/date -Iseconds) - Executed step1 background script.
EOF
