The "Pending" status means that the Pod has not been scheduled to run in any of the worker nodes yet. We can use the describe command to find what is going on.
`kubectl -n staging describe pod test-pod`{{execute}}

Checkout the Events section. What can you see there?

Seems like a resource issue no? On the same describe output you can see how much CPU and Memory the Pod is requesting.

>>Q1: How much Memory is the Pod requesting <<
[ ] 128Mi
[ ] 256Mi
[*] 4Gi

