
SRCREV = "b7825b218e677c65f6849be061b93bd5654991bf"
RDEPENDS:${PN} = "python3-as-python"
#do_install:append () {
#    sed -i ${D}${bindir}/inactive-windows-transparency.py \
#        -e "s|#!/usr/bin/python$|#!/usr/bin/python3|"
#}
