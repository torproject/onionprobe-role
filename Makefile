#
# Makefile for developing the Ansible Roles
#
# Copyright (C) 2024 The Tor Project, Inc.
# SPDX-License-Identifier: AGPL-3.0-or-later
#

# Role name
ROLE = onionprobe

# Folder relative to this Makefile pointing to where the AnCIble is
# installed.
#
# Customize to your needs in your main Makefile. Examples:
#
# ANCIBLE_PATH = vendor/ancible
# ANCIBLE_PATH = vendors/ancible
ANCIBLE_PATH ?= vendors/ancible

# The AnCIble repository URL
ANCIBLE_REPO = https://gitlab.torproject.org/tpo/onion-services/ansible/ancible.git

# Include the AnCIble Makefile
# See https://www.gnu.org/software/make/manual/html_node/Include.html
-include $(ANCIBLE_PATH)/Makefile.ancible

# This is useful when developing your documentation locally and AnCIble is
# not yet installed on your project but you don't want it to be a Git submodule.
#
# If you use this approach, make sure to at the AnCIble path into your
# .gitignore.
vendoring:
	@test   -e $(ANCIBLE_PATH) && git -C $(ANCIBLE_PATH) pull || true
	@test ! -e $(ANCIBLE_PATH) && git clone $(ANCIBLE_REPO) $(ANCIBLE_PATH) || true
