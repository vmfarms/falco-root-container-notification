# Falco Root Container Notification

## Introduction
This project was developed as a "module" for the [falco-argo-container-isolation](https://github.com/vmfarms/falco-argo-container-isolation), and content available in this repository is supposed to be deployed on top of the falco-argo-container-isolation one. The main go is to enable a Falco rule to identify containers being spawned as root into a Kubernetes cluster, and notify these events through Slack. Falco can notify basically anything, but in order to keep things simple and show its power, only new containers running as root will trigger the notification.


## Features
- Add the required configuration to enable Falco to identify containers running as root in a Kubernetes cluster
- Sends a Slack webhook to a specific Slack channel

## Requiments
The following is required to run this project properly:
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/helm/helm_install/)
- [falco-argo-container-isolation](https://github.com/vmfarms/falco-argo-container-isolation)

## Usage
- Clone the repo
- Create a new app to send webhooks to a Slack channel. Refer to their [documentation](https://api.slack.com/messaging/webhooks) for guidence
- Replace the `REPLACE_ME` in the `config/faldosickick-patch.yaml` with the Slack webhook url
- Install its content using `make install`

## License
This project is distributed under GNU GPLv3. See [LICENSE](LICENSE).
