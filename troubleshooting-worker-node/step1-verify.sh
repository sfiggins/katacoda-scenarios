WORKER_NODE_OUTPUT=$(kubectl get node node01)

if echo "$WORKER_NODE_OUTPUT" | grep -q "Ready"; then
  echo "done"
fi