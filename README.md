# Spheron Provider Helm Chart

A Helm chart for deploying the Spheron Provider on Kubernetes clusters, including bare metal environments. The Spheron Provider enables integration with the Spheron Network, allowing your infrastructure to participate as a provider node.

## Features
- Deploys the Spheron Provider as a Kubernetes StatefulSet
- Configurable resource requests and limits

## Prerequisites
- Kubernetes 1.20+
- Helm 3.0+

## Installation

1. Add the Spheron Helm repository (if available):
   ```sh
   git clone <this-repo-url>
   kubectl apply -f crd/crd.yaml
   cd charts
   ```
2. Install the chart with your custom values:
   ```sh
    helm upgrade --install spheron-provider ./spheron-provider -n spheron-services \
    --set provider.walletPath=/spheron-key/wallet.json \
    --set provider.walletSecret=testPassword \
    --set resources.limits.cpu="2" \
    --set resources.limits.memory="2Gi" \
    --set resources.requests.cpu="1" \
    --set resources.requests.memory="1Gi" 
   ```

   You can override values directly with `--set` flags or by editing `values.yaml`.

## Configuration
The following are the main configurable parameters in `values.yaml`:

| Parameter                | Description                                 | Default                |
|--------------------------|---------------------------------------------|------------------------|
| `image.repository`       | Provider image repository                   | `spheronnetwork/devnet-provider` |
| `image.tag`              | Image tag                                   | `latest-amd64`         |
| `provider.walletPath`    | Path to the wallet file                     | `""`                  |
| `provider.walletSecret`  | Wallet secret                               | `""`                  |
| `provider.home`          | Provider home directory                     | `/spheron-key`         |
| `logs.token`             | Token for logging                           | `""`                  |
| `logs.url`               | Logging endpoint URL                        | `""`                  |
| `resources`              | CPU/memory requests and limits              | See `values.yaml`      |
| `autoscaling.enabled`    | Enable autoscaling                          | `false`                |
| `nodeSelector`           | Node selector for pod assignment            | `{}`                   |
| `tolerations`            | Tolerations for pod assignment              | `[]`                   |
| `affinity`               | Affinity rules for pod assignment           | `{}`                   |

For a full list of configurable values, see [`values.yaml`](./values.yaml).

## Usage
- The provider will run as a StatefulSet and expose an API on port 8443.
- Wallet and secret must be provided for the provider to function.
- Logs and status can be monitored via `kubectl` and the configured logging endpoint.

## Uninstallation
To uninstall the chart and delete all resources:
```sh
helm uninstall spheron-provider --namespace spheron-services 
```

## Contributing
Contributions are welcome! Please open issues or pull requests for improvements, bug fixes, or new features.

## License
[Apache 2.0](./LICENSE)

## Support
For questions or support, please open an issue in this repository or visit [https://spheron.network](https://spheron.network). 