# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..10} )

inherit desktop python-r1

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openstenoproject/${PN}.git"
else
	MY_PV="4.0.0.dev10"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/openstenoproject/${PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
fi

DESCRIPTION="Free and open source real-time stenography engine."
HOMEPAGE="https://www.openstenoproject.org/plover/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64"
RESTRICT="mirror"

IUSE="debug"

DEPEND="
	debug? ( dev-python/pytest )
	dev-python/appdirs
	dev-python/Babel
	dev-python/dbus-python
	dev-python/PyQt5
	dev-python/pyserial
	dev-python/python-xlib
	dev-python/setuptools_scm
	dev-python/wcwidth
	dev-python/wxpython
	dev-python/rtf_tokenize
	dev-python/plover_stroke
"

src_unpack() {
	if [[ "${PV}" != *9999* ]]; then
		unpack "${MY_P}".tar.gz
		mv -T "${MY_P}" "${P}" || die
	fi
}

src_install() {
	python3 setup.py install --root=${D}

	newicon "${PN}/assets/plover.png" "plover.png"
	make_desktop_entry ${PN} Plover plover 'Utility;' ''
}
