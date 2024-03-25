FROM archlinux:latest

ENV RUSTC_WRAPPER=sccache
ENV CARGO_INCREMENTAL=0
ENV CARGO_TARGET_DIR=/paxy/podman-target

# Install Rust
RUN pacman -Sy --noconfirm rustup cargo
# Toolchain setup
RUN /usr/bin/rustup self upgrade-data
RUN rustup default nightly-2024-03-17
# Project dependencies
RUN pacman -Sy --noconfirm gdk-pixbuf2 pango gtk4 pkg-config
# Extras
RUN pacman -S --noconfirm sccache
