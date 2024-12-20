#
# Makefile for developing the Onionprobe Ansible Role
#
# Copyright (C) 2024 The Tor Project, Inc.
# SPDX-License-Identifier: AGPL-3.0-or-later
#

# Parameters
SERVICE = onionprobe

# Provisioning
provision:
	@./scripts/provision

# Linting
lint:
	@ansible-lint

# Podman tests
test-podman:
	@molecule test -s podman

# Local tests
test-local:
	@molecule test -s local
	@echo Waiting for the service to boostrap before checking it...
	@sleep 30
	@sudo service $(SERVICE) status
