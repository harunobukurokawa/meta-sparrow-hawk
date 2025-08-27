SUMMARY = "A wayland image using Sway"

IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs weston"

LICENSE = "MIT"

inherit core-image

require recipes-core/images/core-image-minimal.inc

IMAGE_INSTALL:append:rcar-gen4 = " glmark2"
# Wayland/Weston packages
IMAGE_INSTALL:append:rcar-gen4 = " \
    ${@"packagegroup-renesas-graphics" if "gsx" in d.getVar("MACHINE_FEATURES") else ""} \
    sway \
"

