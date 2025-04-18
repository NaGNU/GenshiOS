#!/bin/bash
chroot --bind /sys sys
chroot --bind /dev dev
chroot --bind /run run
chroot --bind /srv srv
chroot rootfs /bin/bash

