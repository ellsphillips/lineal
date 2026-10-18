"""Shared distribution rules for release checks and local installation."""

from pathlib import Path
import os
import shutil
import sys
import tomllib


ROOT = Path(__file__).resolve().parent.parent
PACKAGE_FILES = ("src", "lib.typ", "typst.toml", "README.md", "LICENSE", "docs")


def manifest():
    with (ROOT / "typst.toml").open("rb") as source:
        return tomllib.load(source)["package"]


def stage_package(destination):
    """Copy the publishable source tree to a new or empty directory."""
    destination = Path(destination).expanduser().resolve()
    if destination == ROOT or ROOT in destination.parents:
        raise ValueError("Package destination must be outside the repository")
    if destination.exists() and any(destination.iterdir()):
        raise ValueError(f"Package destination is not empty: {destination}")
    for name in PACKAGE_FILES:
        if not (ROOT / name).exists():
            raise ValueError(f"Required package path is missing: {name}")
    destination.mkdir(parents=True, exist_ok=True)
    for name in PACKAGE_FILES:
        source = ROOT / name
        if source.is_dir():
            shutil.copytree(source, destination / name)
        else:
            shutil.copy2(source, destination / name)
    return destination


def local_package_root():
    """Locate Typst's local package directory without touching its cache."""
    if override := os.environ.get("TYPST_PACKAGE_PATH"):
        return Path(override).expanduser()
    if sys.platform == "darwin":
        return Path.home() / "Library/Application Support/typst/packages"
    if sys.platform == "win32":
        base = Path(os.environ.get("APPDATA", Path.home() / "AppData/Roaming"))
        return base / "typst/packages"
    base = Path(os.environ.get("XDG_DATA_HOME", Path.home() / ".local/share"))
    return base / "typst/packages"


def install_local(replace=False):
    metadata = manifest()
    destination = local_package_root() / "local" / metadata["name"] / metadata["version"]
    if destination.exists() and replace:
        if destination.is_symlink():
            raise ValueError("Refusing to replace a symlinked local package")
        with (destination / "typst.toml").open("rb") as source:
            installed = tomllib.load(source)["package"]
        if any(installed.get(key) != metadata[key] for key in ("name", "version")):
            raise ValueError("Existing local package does not match this name and version")
        shutil.rmtree(destination)
    return stage_package(destination)
