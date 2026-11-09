---
title: Git LFS
description: Git extension for versioning large files — stores pointers in Git and the content on an LFS server
keywords: git,lfs,git-lfs,large-files,binary,assets,vcs,storage
---

# Git LFS

Git Large File Storage replaces large files — audio, video, datasets,
graphics — with small text pointers inside Git, while the file contents live
on a remote LFS server (GitHub, GitLab, Bitbucket, Gitea and others speak the
protocol). Clones stay small and fast; the real bytes are fetched on checkout.

Git invokes it as `git lfs <command>` once `git-lfs` is on `PATH`.

## What's included

- **git-lfs** — the single binary: `install`, `track`/`untrack`, `fetch`,
  `pull`, `push`, `checkout`, `migrate`, `lock`/`unlock`, `ls-files`,
  `prune`, `pointer`, and the `clean`/`smudge`/`filter-process` hooks Git
  calls on every add and checkout.
- **install.sh** (Linux and macOS) — upstream's system-install script, shipped
  as-is in the release archive.
- Man pages for every subcommand, on `MANPATH` (`man git-lfs-track`).

## Setup

- Needs `git` on `PATH`. Run `git lfs install` once per user to register the
  LFS filters in `~/.gitconfig`.

## Links

- [Git LFS website](https://git-lfs.com)
- [Git LFS on GitHub](https://github.com/git-lfs/git-lfs)
