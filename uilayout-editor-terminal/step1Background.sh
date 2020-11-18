#!/bin/bash

mkdir -p /test
cat >> /test/background.log <<EOF
$(/bin/date -Iseconds) - Executed step1 background script.
EOF
