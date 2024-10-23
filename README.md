# Ansible role for Onionprobe

This [Ansible][] role manages [Onionprobe][] installations.

## Usage

Sample usage in an Ansible playbook:

```yaml
- name: Onionprobe
  hosts: myonionprober
  roles:
    - onionprobe
```

## Variables

Check [defaults/main.yml](defaults/main.yml) for a commented list of variables.

[Ansible]: https://ansible.com
[Onionprobe]: https://gitlab.torproject.org/tpo/onion-services/onionprobe
