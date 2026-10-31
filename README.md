# notmpc-overlay

Gentoo overlay for [notmpc](https://github.com/gtlaserbeast/notmpc), a
terminal MPD client built on notcurses.

## Install

```sh
eselect repository add notmpc-overlay git https://github.com/gtlaserbeast/notmpc-overlay.git
emaint sync -r notmpc-overlay
emerge --ask media-sound/notmpc
```

The package is keyworded `~amd64`; on a stable system accept it with

```sh
echo 'media-sound/notmpc ~amd64' >> /etc/portage/package.accept_keywords/notmpc
```

## Packages

| Package | Description |
| --- | --- |
| `media-sound/notmpc` | Terminal MPD client built on notcurses, with album art and a visualizer |

Bugs in the ebuild go to this repo's issues; bugs in notmpc itself go to
[notmpc's issues](https://github.com/gtlaserbeast/notmpc/issues).

The ebuilds are distributed under the GNU General Public License v2, as
their headers say.
