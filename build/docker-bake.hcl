group "default" {
  targets = ["2_1_0_2", "2_2_0_0", "2_2_0_1", "2_2_0_2", "2_2_0_3", "3_0_0_0", "3_0_0_1", "3_0_0_2", "3_0_0_2-2", "3_1_0_0"]
}

target "build-dockerfile" {
  dockerfile = "Dockerfile"
}

target "build-dockerfile-legacy" {
  dockerfile = "Dockerfile.legacy"
}

target "build-platforms" {
  platforms = ["linux/amd64", "linux/armhf", "linux/aarch64"]
}

target "build-common" {
  pull = true
}

target "2_1_0_2" {
  inherits = ["build-dockerfile-legacy", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:2.1.0.2", "docker.io/nlss/s6-rootfs:2.1"]
  args = {
    S6_OVERLAY_VERSION = "2.1.0.2"
  }
}

target "2_2_0_0" {
  inherits = ["build-dockerfile-legacy", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:2.2.0.0"]
  args = {
    S6_OVERLAY_VERSION = "2.2.0.0"
  }
}

target "2_2_0_1" {
  inherits = ["build-dockerfile-legacy", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:2.2.0.1"]
  args = {
    S6_OVERLAY_VERSION = "2.2.0.1"
  }
}

target "2_2_0_2" {
  inherits = ["build-dockerfile-legacy", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:2.2.0.2"]
  args = {
    S6_OVERLAY_VERSION = "2.2.0.2"
  }
}

target "2_2_0_3" {
  inherits = ["build-dockerfile-legacy", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:2.2.0.3", "docker.io/nlss/s6-rootfs:2.2"]
  args = {
    S6_OVERLAY_VERSION = "2.2.0.3"
  }
}

target "3_0_0_0" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:3.0.0.0", "docker.io/nlss/s6-rootfs:3.0.0.0-1"]
  args = {
    S6_OVERLAY_VERSION = "3.0.0.0-1"
    S6_OVERLAY_BIN_PAK_EXT = "-3.0.0.0-1.tar.xz"
    S6_OVERLAY_BASE_PAK_EXT = "-3.0.0.0-1.tar.xz"
  }
}

target "3_0_0_1" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:3.0.0.1"]
  args = {
    S6_OVERLAY_VERSION = "3.0.0.1"
    S6_OVERLAY_BIN_PAK_EXT = "-3.0.0.1.tar.xz"
    S6_OVERLAY_BASE_PAK_EXT = "-3.0.0.1.tar.xz"
  }
}

target "3_0_0_2" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:3.0.0.2"]
  args = {
    S6_OVERLAY_VERSION = "3.0.0.2"
    S6_OVERLAY_BIN_PAK_EXT = "-3.0.0.2.tar.xz"
    S6_OVERLAY_BASE_PAK_EXT = "-3.0.0.2.tar.xz"
  }
}

target "3_0_0_2-2" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:3.0.0.2-2", "docker.io/nlss/s6-rootfs:3.0"]
  args = {
    S6_OVERLAY_VERSION = "3.0.0.2-2"
    S6_OVERLAY_BIN_PAK_EXT = "-3.0.0.2-2.tar.xz"
    S6_OVERLAY_BASE_PAK_EXT = "-3.0.0.2-2.tar.xz"
  }
}

target "3_1_0_0" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/s6-rootfs:3.1.0.0", "docker.io/nlss/s6-rootfs:3.1", "docker.io/nlss/s6-rootfs:latest"]
  args = {
    S6_OVERLAY_VERSION = "3.1.0.0"
  }
}