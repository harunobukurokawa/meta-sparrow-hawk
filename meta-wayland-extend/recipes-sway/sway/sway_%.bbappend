FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "\
    file://sway.service \
    file://sway-autologin \
"

inherit systemd
SYSTEMD_SERVICE_FILENAME = "${BPN}.service"
SYSTEMD_SERVICE:${PN} = "${SYSTEMD_SERVICE_FILENAME}"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

PACKAGECONFIG:append = " swaybar swaynag"

FILES:${PN} += " ${sysconfdir}/profile.d/wlr-backends.sh"
FILES:${PN} += " ${sysconfdir}/pam.d/sway-autologin"

do_install:append () {
    install -d ${D}${sysconfdir}/profile.d
    echo 'export WLR_BACKENDS=drm,libinput' > ${D}${sysconfdir}/profile.d/wlr-backends.sh
    echo 'export XDG_RUNTIME_DIR=/run/user/$(id -u)' >> ${D}${sysconfdir}/profile.d/wlr-backends.sh
    chmod 0644 ${D}${sysconfdir}/profile.d/wlr-backends.sh

    install -d ${D}/${sysconfdir}/pam.d/
    install -m 0644 ${WORKDIR}/sway-autologin ${D}/${sysconfdir}/pam.d/sway-autologin

    install -d ${D}/${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/${SYSTEMD_SERVICE_FILENAME} ${D}/${systemd_unitdir}/system
}

