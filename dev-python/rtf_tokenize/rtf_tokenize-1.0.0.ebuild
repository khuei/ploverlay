# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Simple RTF tokenizer package for Python"
HOMEPAGE="https://github.com/benoit-pierre/rtf_tokenize https://pypi.org/project/rtf-tokenize/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64"

python_install_all() {
	distutils-r1_python_install_all
}
