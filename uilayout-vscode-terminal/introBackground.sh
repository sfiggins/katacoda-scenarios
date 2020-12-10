#!/bin/bash

mkdir -p /test
cat >> /test/background.log <<EOF
$(/bin/date -Iseconds) - Executed intro background script.
EOF
