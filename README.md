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
    available in the remote system.

[Systemd]: https://systemd.io
[ansible.builin.pip]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/pip_module.html
[standalone]: https://onionservices.torproject.org/apps/web/onionprobe/standalone/
[Docker]: https://docker.com
[Podman]: https://podman.io
[Docker Compose]: https://docs.docker.com/compose/
[Podman Compose]: https://github.com/containers/podman-compose

## Usage

Sample usage in an Ansible playbook:

```yaml
- name: Onionprobe standalone monitor
  hosts: my-onion-prober

  roles:
    - onionprobe

  vars:
    onionprobe_installation: package
    onionprobe_operation: single
    onionprobe_config: securedrop.yml

- name: Onionprobe standalone monitor
  hosts: my-onion-monitor

  roles:
    - onionprobe

  vars:
    onionprobe_installation: repository
    onionprobe_operation: standalone

```

## Configuration

Check [defaults/main.yml](defaults/main.yml) for a commented list of variables.
