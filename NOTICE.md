# NOTICE

This repository packages and redistributes upstream software published by
[Git LFS](https://github.com/git-lfs). The Apache-2.0 license in
[`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It does
**not** cover any upstream-derived asset — each package's redistributed bytes
carry their own license, recorded below.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `git-lfs` | `ghcr.io/ocx-contrib/git-lfs/git-lfs` | `MIT AND BSD-3-Clause` |

---

## `git-lfs`

Upstream: <https://github.com/git-lfs/git-lfs>
Published to `ghcr.io/ocx-contrib/git-lfs/git-lfs`.

| Component | SPDX | Holder |
|---|---|---|
| Git LFS | **MIT** | Copyright (c) 2014- GitHub, Inc. and Git LFS contributors |
| Portions of `subprocess/` and `tools/` copied from Go | **BSD-3-Clause** | Copyright (c) 2009,2010 The Go Authors |

Permissive; redistribution granted under
<https://github.com/git-lfs/git-lfs/blob/main/LICENSE.md>.
`gh api repos/git-lfs/git-lfs/license` reports `NOASSERTION` only because
`LICENSE.md` carries both blocks; the file was read in full.

[`git-lfs/logo.svg`](git-lfs/logo.svg) is the mark from upstream's
`git-lfs/git-lfs.github.com` `images/git-lfs-logo.svg`, with the wordmark
removed; [`git-lfs/logo.png`](git-lfs/logo.png) is a 512px raster of it.
"Git LFS" and "GitHub" are names of their respective owners; this mirror is
not affiliated with or endorsed by them.
