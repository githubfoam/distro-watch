#!/bin/bash -eux

# Disable PackageKit service
systemctl mask packagekit.service
