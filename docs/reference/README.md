# redpanda

![Version: 3.0.7](https://img.shields.io/badge/Version-3.0.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v23.1.1](https://img.shields.io/badge/AppVersion-v23.1.1-informational?style=flat-square)

Redpanda is the real-time engine for modern apps.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| redpanda-data |  | <https://github.com/orgs/redpanda-data/people> |

## Source Code

* <https://github.com/redpanda-data/helm-charts>

## Requirements

Kubernetes: `^1.21.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://charts.redpanda.com | console | >=0.5 <1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth.sasl.enabled | bool | `false` |  |
| auth.sasl.mechanism | string | `"SCRAM-SHA-512"` |  |
| auth.sasl.secretRef | string | `"redpanda-users"` |  |
| auth.sasl.users[0].mechanism | string | `"SCRAM-SHA-512"` |  |
| auth.sasl.users[0].name | string | `"admin"` |  |
| auth.sasl.users[0].password | string | `"change-me"` |  |
| clusterDomain | string | `"cluster.local"` |  |
| commonLabels | object | `{}` |  |
| config.cluster | object | `{}` |  |
| config.node | object | `{}` |  |
| config.tunable.compacted_log_segment_size | int | `67108864` |  |
| config.tunable.group_topic_partitions | int | `16` |  |
| config.tunable.kafka_batch_max_bytes | int | `1048576` |  |
| config.tunable.kafka_connection_rate_limit | int | `1000` |  |
| config.tunable.log_segment_size | int | `134217728` |  |
| config.tunable.log_segment_size_max | int | `268435456` |  |
| config.tunable.log_segment_size_min | int | `16777216` |  |
| config.tunable.max_compacted_log_segment_size | int | `536870912` |  |
| config.tunable.topic_partitions_per_shard | int | `1000` |  |
| console.config | object | `{}` |  |
| console.configmap.create | bool | `false` |  |
| console.deployment.create | bool | `false` |  |
| console.enabled | bool | `true` |  |
| console.secret.create | bool | `false` |  |
| external.enabled | bool | `true` |  |
| external.type | string | `"NodePort"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"vectorized/redpanda"` |  |
| image.tag | string | `""` |  |
| license_key | string | `""` |  |
| license_secret_ref | object | `{}` |  |
| listeners.admin.external.default.advertisedPorts[0] | int | `31644` |  |
| listeners.admin.port | int | `9644` |  |
| listeners.admin.tls.cert | string | `"default"` |  |
| listeners.admin.tls.requireClientAuth | bool | `false` |  |
| listeners.http.enabled | bool | `true` |  |
| listeners.http.external.default.advertisedPorts[0] | int | `30082` |  |
| listeners.http.external.default.port | int | `8083` |  |
| listeners.http.kafkaEndpoint | string | `"default"` |  |
| listeners.http.port | int | `8082` |  |
| listeners.http.tls.cert | string | `"default"` |  |
| listeners.http.tls.requireClientAuth | bool | `false` |  |
| listeners.kafka.external.default.advertisedPorts[0] | int | `31092` |  |
| listeners.kafka.external.default.port | int | `9094` |  |
| listeners.kafka.port | int | `9093` |  |
| listeners.kafka.tls.cert | string | `"default"` |  |
| listeners.kafka.tls.requireClientAuth | bool | `false` |  |
| listeners.rpc.port | int | `33145` |  |
| listeners.rpc.tls.cert | string | `"default"` |  |
| listeners.rpc.tls.requireClientAuth | bool | `false` |  |
| listeners.schemaRegistry.enabled | bool | `true` |  |
| listeners.schemaRegistry.external.default.advertisedPorts[0] | int | `30081` |  |
| listeners.schemaRegistry.external.default.port | int | `8084` |  |
| listeners.schemaRegistry.kafkaEndpoint | string | `"default"` |  |
| listeners.schemaRegistry.port | int | `8081` |  |
| listeners.schemaRegistry.tls.cert | string | `"default"` |  |
| listeners.schemaRegistry.tls.requireClientAuth | bool | `false` |  |
| logging.logLevel | string | `"info"` |  |
| logging.usageStats.enabled | bool | `true` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| post_install_job.enabled | bool | `true` |  |
| post_upgrade_job.enabled | bool | `true` |  |
| rackAwareness.enabled | bool | `false` |  |
| rackAwareness.nodeAnnotation | string | `"topology.kubernetes.io/zone"` |  |
| rbac.annotations | object | `{}` |  |
| rbac.enabled | bool | `false` |  |
| resources.cpu.cores | int | `1` |  |
| resources.memory.container.max | string | `"2.5Gi"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| statefulset.annotations | object | `{}` |  |
| statefulset.budget.maxUnavailable | int | `1` |  |
| statefulset.initContainerImage.repository | string | `"busybox"` |  |
| statefulset.initContainerImage.tag | string | `"latest"` |  |
| statefulset.initContainers.configurator.resources | object | `{}` |  |
| statefulset.initContainers.setDataDirOwnership.enabled | bool | `false` |  |
| statefulset.initContainers.setDataDirOwnership.resources | object | `{}` |  |
| statefulset.initContainers.setTieredStorageCacheDirOwnership.resources | object | `{}` |  |
| statefulset.initContainers.tuning.resources | object | `{}` |  |
| statefulset.livenessProbe.failureThreshold | int | `3` |  |
| statefulset.livenessProbe.initialDelaySeconds | int | `10` |  |
| statefulset.livenessProbe.periodSeconds | int | `10` |  |
| statefulset.nodeSelector | object | `{}` |  |
| statefulset.podAffinity | object | `{}` |  |
| statefulset.podAntiAffinity.custom | object | `{}` |  |
| statefulset.podAntiAffinity.topologyKey | string | `"kubernetes.io/hostname"` |  |
| statefulset.podAntiAffinity.type | string | `"hard"` |  |
| statefulset.podAntiAffinity.weight | int | `100` |  |
| statefulset.priorityClassName | string | `""` |  |
| statefulset.readinessProbe.failureThreshold | int | `3` |  |
| statefulset.readinessProbe.initialDelaySeconds | int | `1` |  |
| statefulset.readinessProbe.periodSeconds | int | `10` |  |
| statefulset.readinessProbe.successThreshold | int | `1` |  |
| statefulset.replicas | int | `3` |  |
| statefulset.securityContext.fsGroup | int | `101` |  |
| statefulset.securityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| statefulset.securityContext.runAsUser | int | `101` |  |
| statefulset.startupProbe.failureThreshold | int | `120` |  |
| statefulset.startupProbe.initialDelaySeconds | int | `1` |  |
| statefulset.startupProbe.periodSeconds | int | `10` |  |
| statefulset.tolerations | list | `[]` |  |
| statefulset.topologySpreadConstraints.maxSkew | int | `1` |  |
| statefulset.topologySpreadConstraints.topologyKey | string | `"topology.kubernetes.io/zone"` |  |
| statefulset.topologySpreadConstraints.whenUnsatisfiable | string | `"ScheduleAnyway"` |  |
| statefulset.updateStrategy.type | string | `"RollingUpdate"` |  |
| storage.hostPath | string | `""` |  |
| storage.persistentVolume.annotations | object | `{}` |  |
| storage.persistentVolume.enabled | bool | `true` |  |
| storage.persistentVolume.labels | object | `{}` |  |
| storage.persistentVolume.size | string | `"20Gi"` |  |
| storage.persistentVolume.storageClass | string | `""` |  |
| storage.tieredConfig.cloud_storage_access_key | string | `""` |  |
| storage.tieredConfig.cloud_storage_api_endpoint | string | `""` |  |
| storage.tieredConfig.cloud_storage_azure_container | string | `nil` |  |
| storage.tieredConfig.cloud_storage_azure_shared_key | string | `nil` |  |
| storage.tieredConfig.cloud_storage_azure_storage_account | string | `nil` |  |
| storage.tieredConfig.cloud_storage_bucket | string | `""` |  |
| storage.tieredConfig.cloud_storage_cache_size | int | `21474836480` |  |
| storage.tieredConfig.cloud_storage_credentials_source | string | `"config_file"` |  |
| storage.tieredConfig.cloud_storage_enable_remote_read | bool | `true` |  |
| storage.tieredConfig.cloud_storage_enable_remote_write | bool | `true` |  |
| storage.tieredConfig.cloud_storage_enabled | bool | `false` |  |
| storage.tieredConfig.cloud_storage_region | string | `""` |  |
| storage.tieredConfig.cloud_storage_secret_key | string | `""` |  |
| storage.tieredStorageHostPath | string | `""` |  |
| storage.tieredStoragePersistentVolume.annotations | object | `{}` |  |
| storage.tieredStoragePersistentVolume.enabled | bool | `false` |  |
| storage.tieredStoragePersistentVolume.labels | object | `{}` |  |
| storage.tieredStoragePersistentVolume.storageClass | string | `""` |  |
| tls.certs.default.caEnabled | bool | `true` |  |
| tls.enabled | bool | `true` |  |
| tolerations | list | `[]` |  |
| tuning.tune_aio_events | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
