# Onionprobe Ansible Role ChangeLog

## v0.0.5 - 2024-12-17

* Fix `onionprobe_config_script_path` handling.

## v0.0.4 - 2024-12-10

* Fix CI issue with recent `python:bookworm` container images
  ([tpo/onion-services/ansible/onionprobe-role!5][]).

[tpo/onion-services/ansible/onionprobe-role!5]: https://gitlab.torproject.org/tpo/onion-services/ansible/onionprobe-role/-/merge_requests/5

## v0.0.3 - 2024-12-04

* Adds `onionprobe_home` variable, defaulting to `/home/onionprobe`.
  In most situations it can also be set to the same value as `onionprobe_path`,
  but note that this can lead to a git clone error when running as root, due to
  Ansible using `onionprobe_path` as a base for temporary files (and Git refuses
  to clone into non-empty folders). Example error:

        TASK [onionprobe : installation | repository | Manage the Onionprobe Git repository] ***
        [WARNING]: Module remote_tmp /var/lib/onionprobe/.ansible/tmp did not
        exist and was created with a mode of 0700, this may cause issues when
        running as another user. To avoid this, create the remote_tmp dir with
        the correct permissions manually
        fatal: [oniontreva01]: FAILED! => {
          "changed": false,
          "cmd": "/usr/bin/git clone --origin origin https://gitlab.torproject.org/tpo/onion-services/onionprobe.git /var/lib/onionprobe",
          "msg": "fatal: destination path '/var/lib/onionprobe' already exists and is not an empty directory.",
          "rc": 128,
          "stderr": "fatal: destination path '/var/lib/onionprobe' already exists and is not an empty directory.\n",
          "stderr_lines": ["fatal: destination path '/var/lib/onionprobe' already exists and is not an empty directory."],
          "stdout": "",
          "stdout_lines": []
        }

* Miscellaneous fixes.

## v0.0.2 - 2024-12-02

* Documentation:
  * Installation procedure.

## v0.0.1 - 2024-11-01

* Initial version with:
  * Full support for all available installation methods.

  * Basic documentation.

  * Tests with [GitLab CI][].

[GitLab CI]: https://docs.gitlab.com/ee/ci/
