# Ansible role for Onionprobe

This [Ansible][] role manages [Onionprobe][].

It can install [Onionprobe][] from it's [Git][] repository, [from PyPI][]
or using a distribution-provided package (if available).

It can configure [Onionprobe][] to run as a single service or in the
[standalone][] mode.

[Ansible]: https://ansible.com
[Onionprobe]: https://gitlab.torproject.org/tpo/onion-services/onionprobe
[Git]: https://git-scm.com
[from PyPI]: https://pypi.org/project/onionprobe/

## Supported systems

Tested and supported:

* [Debian](https://debian.org).

Supported:

* [Ubuntu](https://ubuntu.com).

Other systems may have only _partial_ support:

* Installation from distro package may not be supported.
* Service management may be only partially supported.

Merge requests are welcome to cover more Operating Systems.

## Requirements

* [Ansible][].
* [Systemd][], if the service is to be managed.
* The requirements to run [ansible.builtin.pip][] if installing Onionprobe [from PyPI][].
* For the [standalone][] operation mode:
  * [Docker][] and [Docker Compose][], or [Podman][] and [Podman Compose][] should be
    available in the remote system. As of 2024-10, [Podman][] support is still
    [experimental][podman-experimental].

[Systemd]: https://systemd.io
[ansible.builin.pip]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/pip_module.html
[standalone]: https://onionservices.torproject.org/apps/web/onionprobe/standalone/
[Docker]: https://docker.com
[Podman]: https://podman.io
[Docker Compose]: https://docs.docker.com/compose/
[Podman Compose]: https://github.com/containers/podman-compose
[podman-experimental]: https://gitlab.torproject.org/tpo/onion-services/ansible/onionprobe-role/-/issues/1#note_3125493

## Usage

Sample usage in an Ansible playbook for a simple monitoring service:

```yaml
- name: Onionprobe prober
  hosts: my-onion-prober

  roles:
    - onionprobe

  vars:
    # Installs Onionprobe using the distribution package manager
    onionprobe_installation: distro

    # Set operation to "single" mode (i.e, just the Onionprobe service)
    onionprobe_operation: single

    # Monitors SecureDrop instances
    onionprobe_config: securedrop.yml
```

Another example, this time for the full [standalone][] node:

```yaml
- name: Onionprobe standalone monitor
  hosts: my-onion-monitor

  roles:
    - onionprobe

  vars:
    # Installs Onionprobe from it's Git repository
    onionprobe_installation: repository

    # Sets operation to standalone (containerized services)
    onionprobe_operation: standalone

```

## Configuration

Check [defaults/main.yml](defaults/main.yml) for a commented list of variables.

## Development

This role has [molecule tests](molecule):

* The `podman` scenario is a generic one and is well suited for testing both
  locally and through CI.
* The `local` scenario actually applies the configuration into the running
  node, so be careful were to run it.

A [Makefile](Makefile) exists to help local testing.
