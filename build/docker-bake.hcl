group "default" {
  targets = [
    "3_1_6_0", "3_1_6_1", "3_1_6_2"
  ]
}

target "build-dockerfile" {
  dockerfile = "Dockerfile"
}

target "build-dockerfile-legacy" {
  dockerfile = "Dockerfile.legacy"
}

target "build-platforms" {
  platforms = ["linux/amd64"]
}

target "build-common" {
  pull = true
}

variable "REGISTRY_CACHE" {
  default = "ghcr.io/kohanaxworld/s6-rootfs-cache"
}

######################
# Define the functions
######################

# Get the arguments for the build
function "get-args" {
  params = [version]
  result = {
    S6_OVERLAY_VERSION = version
  }
}

# Get the arguments for the build
function "get-args-with-pak-ext" {
  params = [version, pak_ext]
  result = {
    S6_OVERLAY_VERSION = version
    S6_OVERLAY_PAK_EXT = pak_ext
  }
}

# Get the cache-from configuration
function "get-cache-from" {
  params = [version]
  result = [
    "type=registry,ref=${REGISTRY_CACHE}:${sha1("${version}-${BAKE_LOCAL_PLATFORM}")}"
  ]
}

# Get the cache-to configuration
function "get-cache-to" {
  params = [version]
  result = [
    "type=registry,mode=max,ref=${REGISTRY_CACHE}:${sha1("${version}-${BAKE_LOCAL_PLATFORM}")}"
  ]
}

# Get list of image tags and registries
# Takes a version and a list of extra versions to tag
# eg. get-tags("3.1.4.1", ["3.1", "latest"])
function "get-tags" {
  params = [version, extra_versions]
  result = concat(
    [
      "ghcr.io/kohanaxworld/s6-rootfs:${version}"
    ],
    flatten([
      for extra_version in extra_versions : [
        "ghcr.io/kohanaxworld/s6-rootfs:${extra_version}"
      ]
    ])
  )
}

##########################
# Define the build targets
##########################

target "3_1_6_0" {
  inherits   = ["build-dockerfile", "build-platforms", "build-common"]
  cache-from = get-cache-from("3.1.6.0")
  cache-to   = get-cache-to("3.1.6.0")
  tags       = get-tags("3.1.6.0", [])
  args       = get-args("3.1.6.0")
}

target "3_1_6_1" {
  inherits   = ["build-dockerfile", "build-platforms", "build-common"]
  cache-from = get-cache-from("3.1.6.1")
  cache-to   = get-cache-to("3.1.6.1")
  tags       = get-tags("3.1.6.1", [])
  args       = get-args("3.1.6.1")
}

target "3_1_6_2" {
  inherits   = ["build-dockerfile", "build-platforms", "build-common"]
  cache-from = get-cache-from("3.1.6.2")
  cache-to   = get-cache-to("3.1.6.2")
  tags       = get-tags("3.1.6.2", ["3.1", "3.1.6", "latest"])
  args       = get-args("3.1.6.2")
}
