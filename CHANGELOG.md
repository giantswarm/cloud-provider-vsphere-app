# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Pull images from Azure CR.

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

[Unreleased]: https://github.com/giantswarm/cloud-provider-vsphere-app/compare/v1.6.0...HEAD
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
