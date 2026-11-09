# git-lfs/tests/smoke.star — asserts the contract, never prose.
#
# No container image ships git, and the bare Linux keys claim the binary needs
# nothing of the host — so the functional check uses `git-lfs pointer --file`,
# which hashes a file into an LFS pointer without a repository (it warns on
# stderr that git is absent and still exits 0; measured on 3.6.1 + 3.8.1 in
# stock alpine:3.20).

GIT_LFS = "git-lfs.exe" if ocx.target_platform.os == ocx.os.Windows else "git-lfs"

# Tier 1 + 2: liveness + version shape.
r_version = ocx.run(GIT_LFS, "version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"git-lfs/\d+\.\d+\.\d+")

# Tier 3: pointer for hermetic input. The oid is sha256("hello\n") — the
# pointer spec (v1) is a stable wire format, so a binary that hashed nothing,
# or the wrong bytes, reds here.
ocx.write_file("f.bin", "hello\n")
r_ptr = ocx.run(GIT_LFS, "pointer", "--file=f.bin")
expect.ok(r_ptr)
expect.contains(r_ptr.stdout, "version https://git-lfs.github.com/spec/v1")
expect.contains(r_ptr.stdout, "oid sha256:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03")
expect.contains(r_ptr.stdout, "size 6")

# Negative control: different bytes, different oid.
ocx.write_file("g.bin", "world\n")
r_ptr2 = ocx.run(GIT_LFS, "pointer", "--file=g.bin")
expect.ok(r_ptr2)
expect.false("5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03" in r_ptr2.stdout)
expect.contains(r_ptr2.stdout, "oid sha256:e258d248fda94c63753607f7c4494ee0fcbe92f1a76bfdac795c9d84101eb317")
expect.contains(r_ptr2.stdout, "size 6")

# Tier 4: MANPATH wiring.
def check_manpath():
    v = ocx.env("MANPATH")
    expect.ne(v, None)
    expect.contains(v, ocx.package_root)

check_manpath()
