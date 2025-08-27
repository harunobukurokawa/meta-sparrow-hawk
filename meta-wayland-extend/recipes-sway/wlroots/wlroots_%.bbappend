EXTRA_OEMESON += "-Dexamples=false"
do_install:prepend () {
    mkdir ${B}/tinywl
    touch ${B}/tinywl/tinywl
}
# v0.18.2
#SRC_URI = "git://gitlab.freedesktop.org/wlroots/wlroots.git;branch=0.18;protocol=https"
#SRCREV = "cda69b696d65a53d5d5e75dfed059a3803e0d700"
# v0.17.4
#SRC_URI = "git://gitlab.freedesktop.org/wlroots/wlroots.git;branch=0.17;protocol=https"
#SRCREV = "a2d2c38a3127745629293066beeed0a649dff8de"

