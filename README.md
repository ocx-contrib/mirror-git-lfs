# mirror-git-lfs

OCX mirror for [Git LFS](https://github.com/git-lfs/git-lfs).
One repository, one spec directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [Git LFS](https://github.com/git-lfs/git-lfs) | [`git-lfs/mirror.yml`](git-lfs/mirror.yml) | `ghcr.io/ocx-contrib/git-lfs/git-lfs` | [`ocx.sh/git-lfs/git-lfs`](https://index.ocx.sh/git-lfs/git-lfs) | `MIT AND BSD-3-Clause` |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, then announced
into the OCX index.

## Layout

```
mirror-base.yml         repo-wide policy every spec inherits via `extends:`
git-lfs/
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface (linux, darwin)
├── metadata-windows.json  bundle interface (windows: no install.sh)
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

⚠️ `extends:` is a **shallow** merge of top-level keys — restate a block in
full or not at all. `platforms:` lives in each spec, never in the base.

## Notes on git-lfs

- Linux builds are **static** Go (no `PT_INTERP`) → bare keys, ubuntu +
  alpine + fedora container legs.
- The smoke test hashes a file with `git-lfs pointer --file`, which needs no
  `git` — none of the container images ships one.

## Editing

```bash
direnv allow                                   # pinned toolchain onto PATH
ocx-mirror package validate git-lfs/mirror.yml
ocx-mirror package pipeline generate ci --spec git-lfs/mirror.yml   # name EVERY spec
```

Never hand-edit `.github/workflows/mirror-*.yml` / `describe-*.yml` etc. —
`verify-generated.yml` fails CI on drift.
