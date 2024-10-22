# Ansible role for Onionprobe

This [Ansible][] role manages [Onionprobe][] installations.

By default, it sets up a [standalone monitoring node][standalone] using [Docker][]
as the container manager, but 

## Usage

Sample usage in an Ansible playbook:

```yaml
- name: Onionprobe
  hosts: myonionprober
  roles:
    - onionprobe
```

[standalone]: https://onionservices.torproject.org/apps/web/onionprobe/standalone/

## Variables

Check [defaults/main.yml](defaults/main.yml) for a commented list of variables.

[Ansible]: https://ansible.com
[Onionprobe]: https://gitlab.torproject.org/tpo/onion-services/onionprobe
