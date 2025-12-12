# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Update to upstream `1.34.0`.

## [2.0.1] - 2025-03-14

### Changed

- Ensure the Helm chart name stays consistent.

## [2.0.0] - 2025-03-13

### Changed

- Remove subcharts in order to deploy only the vSphere CPI (at upstream version `v1.30.0`).

## [1.12.0] - 2025-01-31

### Added

- Add Renovate to track new tags.
- Update `kube-vip` helm chart to `0.6.2`.
- Update `kube-vip` to `0.8.4`.
- Add initContainer to CSI node registrar container to wait for CRD to be registered.

## [1.11.0] - 2024-08-12

### Changed

- Make default storage class configurable.

## [1.10.0] - 2024-07-08

### Changed

- Update vSphere CPI to `1.30` for Kubernetes 1.30 compatibility.

## [1.9.0] - 2024-07-02

### Changed

- Update vSphere CPI to `1.29` for Kubernetes 1.29 compatibility.

## [1.8.0] - 2024-07-02

### Changed

- Update vSphere CPI to `1.28` for Kubernetes 1.28 compatibility.

## [1.7.0] - 2024-06-25

### Changed

- Update vSphere CSI to `3.2.0` for Kubernetes 1.27 compatibility.
- Update vSphere CPI to `1.27.0` for Kubernetes 1.27 compatibility.
- Update `kube-vip` to `0.8.0`.
- Update `kube-vip-cloud-provider` to `0.0.5`.
- Changes to Chart generation logic.

## [1.6.0] - 2024-02-27

### Changed

- Switch default `vip_interface` to `ens192` for Flatcar.
- Bump `kube-vip` version to `v0.6.3`.

## [1.5.1] - 2023-11-23

## [1.5.0] - 2023-07-05

### Changed

- Manifest generation is automated in a backward compatible way.

## [1.4.0] - 2023-04-11

### Added

- Add kube-vip charts.

## [1.3.3] - 2023-03-28

## [1.3.2] - 2023-03-21

### Fixed

- Add network policy for CSI controller.

## [1.3.1] - 2023-03-14

### Changed

- Move CPI into a sub chart.
- Add CSI as a sub chart.
- Improve UX and security. Reorganize values.yaml structure.

## [1.3.0] - 2022-05-17

### Fixed

- Ensure configmap is mounted correctly.

## [1.2.0] - 2022-05-17

### Fixed

- Corrected label indentation on Roles.

## [1.1.0] - 2022-05-17

### Fixed

- Corrected label indentation for daemonset pods.

## [1.0.1] - 2022-05-17

### Added

- Added Giant Swarm helper functions.

### Fixed

- Resolve chart linting issues.

## [1.0.0] - 2022-05-17

### Added

- Add upstream CPI chart at 1.22.6

[Unreleased]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v2.0.1...HEAD
[2.0.1]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.12.0...v2.0.0
[1.12.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.11.0...v1.12.0
[1.11.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.10.0...v1.11.0
[1.10.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.9.0...v1.10.0
[1.9.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.8.0...v1.9.0
[1.8.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.7.0...v1.8.0
[1.7.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.5.1...v1.6.0
[1.5.1]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.5.0...v1.5.1
[1.5.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.3.3...v1.4.0
[1.3.3]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.3.2...v1.3.3
[1.3.2]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.3.1...v1.3.2
[1.3.1]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.4.0...v1.3.1
[1.4.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/giantswarm/cloud-provider-vsphere-app/releases/tag/v1.0.0
