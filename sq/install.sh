i#!/bin/sh
set -e
set -u

__init_sq() {

    pkg_cmd_name="sq"
    
    # Define destination paths
    pkg_dst_cmd="$HOME/.local/bin/sq"
    pkg_dst="$pkg_dst_cmd"

    # Define source paths based on version
    pkg_src_cmd="$HOME/.local/opt/sq-v$WEBI_VERSION/bin/sq"
    pkg_src_dir="$HOME/.local/opt/sq-v$WEBI_VERSION"
    pkg_src="$pkg_src_cmd"

    # Function to install `sq`
    pkg_install() {
        # Create necessary directories
        mkdir -p "$(dirname "$pkg_src_cmd")"

        # Move binary to source directory
        mv ./"$pkg_cmd_name"* "$pkg_src_cmd"
        chmod a+x "$pkg_src_cmd"

        # Create or update symbolic link in ~/.local/bin
        mkdir -p "$(dirname "$pkg_dst_cmd")"
        ln -sf "$pkg_src_cmd" "$pkg_dst_cmd"
    }

    # Function to fetch the current version of `sq` if already installed
    pkg_get_current_version() {
        sq --version 2> /dev/null |
            head -n 1 |
            cut -d ' ' -f 2
    }
}

# Initialize and run installation functions
__init_sq
# Ensure WEBI_VERSION is set, or provide a default version if not specified
WEBI_VERSION="${WEBI_VERSION:-latest}"

echo "Installing sq version $WEBI_VERSION..."
pkg_install
echo "sq has been installed successfully at $pkg_dst_cmd. Make sure $HOME/.local/bin is in your PATH!"

