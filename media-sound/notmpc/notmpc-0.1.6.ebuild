# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.5
	annotate-snippets@0.11.5
	anstyle@1.0.14
	anyhow@1.0.104
	autocfg@1.5.1
	bindgen@0.73.2
	bitflags@2.13.2
	cc@1.10.0
	cexpr@0.6.0
	cfg-if@1.0.5
	clang-sys@1.9.1
	equivalent@1.0.3
	find-msvc-tools@0.1.15
	glob@0.3.4
	hashbrown@0.17.1
	indexmap@2.14.2
	libc@0.2.191
	libloading@0.8.9
	log@0.4.34
	memchr@2.8.3
	minimal-lexical@0.2.1
	nom@7.1.3
	num-complex@0.4.6
	num-integer@0.1.47
	num-traits@0.2.19
	pkg-config@0.3.34
	prettyplease@0.3.0
	primal-check@0.3.4
	proc-macro2@1.0.107
	quote@1.0.47
	regex-automata@0.4.18
	regex-syntax@0.8.11
	regex@1.13.1
	rustc-hash@2.1.3
	rustfft@6.4.1
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_spanned@1.1.2
	shlex@2.0.1
	strength_reduce@0.2.4
	syn@3.0.9
	toml@1.1.8+spec-1.1.0
	toml_datetime@1.1.2+spec-1.1.0
	toml_parser@1.1.5+spec-1.1.0
	toml_writer@1.1.3+spec-1.1.0
	transpose@0.2.3
	unicode-ident@1.0.27
	unicode-width@0.2.3
	windows-link@0.2.1
	winnow@1.0.4
"

LLVM_COMPAT=( {19..23} )
RUST_MIN_VER="1.88.0"

inherit cargo llvm-r2 optfeature

DESCRIPTION="Terminal MPD client drawn with notcurses: album art, braille spectrum, rmpc keys"
HOMEPAGE="https://github.com/gtlaserbeast/notmpc"
SRC_URI="
	https://github.com/gtlaserbeast/notmpc/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-cpp/notcurses-3.0.8:="
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	$(llvm_gen_dep 'llvm-core/clang:${LLVM_SLOT}')
"

pkg_setup() {
	llvm-r2_pkg_setup
	rust_pkg_setup
}

src_install() {
	cargo_src_install
	dodoc README.md config.example.toml
}

pkg_postinst() {
	optfeature "a local music server to play from" media-sound/mpd
}
