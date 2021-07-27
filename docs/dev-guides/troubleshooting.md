[Return to Developer Guide](../dev.md)

## 1. An user's server consiently times out while other users have no difficulty starting a server. ##

Respawn the `hub` pod. Sometimes an internal state within `hub` gets out of sync with the actual state. 

To respawn the `hub` pod, in a terminal:

1. `sk <name-of-cluster>`
1. `kubectl get pods`
1. `kubectl delete pod <name-of-hub-pod>`
