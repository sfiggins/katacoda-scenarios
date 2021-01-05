As you could see with the "free" command the worker node as 3.9GB in total but the Pod was requesting 4GB which more than the total amount of RAM the worker node has. It seems someone by mistake and left the request and limit at 4GB, we have been told the request should be at "256Mi" and limit at "512Mi". The issue has already been addressed in the source repository and we pulled the updated manifest to the cluster.

We cannot update the resources at runtime so we will need to first delete the Pod to then apply the correct config:

`kubectl -n staging delete pod test-pod`{{execute}}

Now that the pod is deleted take a look at the updated manifest, if you are happy the changes were set correct you can then run the "apply" command to send it to the kube-api:

`cat /root/manifests/manifest.yaml`{{execute}}

After you submit the new manifest check that status of the Pod, if it is now running your job is done here.