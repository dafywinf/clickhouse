Your deployment guide is clean and effective. Here’s a **final, polished version** with consistent formatting, clearer comments, and a touch of structure that makes it ideal for use in documentation or README files:

---

# 🚀 ClickHouse Altinity Deployment Guide

## 🧱 Prerequisites

* Helm 3.x installed
* Kubernetes cluster (e.g. kind, Minikube, EKS)
* Access to the correct namespace (or create one)

---

## 🔧 Install and Deploy

### Installation Steps:
```bash
# Add the Altinity ClickHouse Operator Helm chart repository
helm repo add clickhouse-operator https://docs.altinity.com/clickhouse-operator/

# Update local chart repository index
helm repo update

# View available chart versions (latest version appears first)
helm search repo clickhouse-operator

# (Optional) Update chart dependencies (if using Chart.yaml with dependencies)
helm dependency update
```

### Deployment Steps:
```bash
# Deploy your ClickHouse chart for the first time
helm upgrade --install clickhouse . -n clickhouse --create-namespace
```


## (Optional) Uninstall Deployment

```bash
helm uninstall clickhouse --namespace clickhouse
```

### Uninstallation Challenges

The clickhouseinstallation custom resource may not be deleted automatically. This has a finalizer that prevents
deletion. Deletion can be forced by removing the finalizer by editing the customer resource in k9s.

The deployment also *may* have finalizers on the persistent volume claims (PVCs) that prevent deletion. Again these can
be removed by editing the PVCs in k9s.

## Clickhouse Client Access

Install the ClickHouse client to interact with your ClickHouse instance:

https://clickhouse.com/docs/install

*Note:* There is some complexity in this process, so refer to the official documentation for detailed instructions.

Find out the IP address MetalLB has assigned the ClickHouse service:

```bash
# clickhouse-tcp service
kubectl get svc -n clickhouse
```

```bash
clickhouse client --host 192.168.86.13 --port 9000
```
