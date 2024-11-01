#
# Makefile for developing the Onionprobe Ansible Role
#
# Copyright (C) 2024 The Tor Project, Inc.
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Provisioning
provision:
	@./scripts/provision

# Podman tests
test-podman:
	@molecule test -s podman

# Local tests
test-local:
	@molecule test -s local
	@echo Waiting for the service to boostrap before checking it...
	@sleep 30
	@sudo service onionprobe status
