# Troubleshooting

## A. Users
### 1. OSL Servers Time Out ##

**Problem**: An user's server consistently times out while other users have no difficulty starting a server.

**Solution**: Respawn the `hub` pod. Sometimes an internal state within `hub` gets out of sync with the actual state. 

To respawn the `hub` pod, in a terminal:

1. `sk <name-of-cluster>`
1. `kubectl get pods`
1. `kubectl delete pod <name-of-hub-pod>`

