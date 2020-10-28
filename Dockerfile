ARG BASE_IMAGE_PREFIX
#FROM ${BASE_IMAGE_PREFIX}mono
FROM gcr.io/distroless/static:eddfb5cd7a24d656f77afae595ffe6c232eab847


# see hooks/post_checkout
ARG ARCH

ARG BIN=trident-operator
ENV BIN $BIN
ARG K8S=""
ENV K8S $K8S



# HACK: don't fail when no qemu binary provided
COPY .gitignore qemu-${ARCH}-static* /usr/bin/


# annotation labels according to
# https://github.com/opencontainers/image-spec/blob/v1.0.1/annotations.md#pre-defined-annotation-keys
# LABEL org.opencontainers.image.title="OpenRA dedicated server"
# LABEL org.opencontainers.image.description="Image to run a server instance for OpenRA"
# LABEL org.opencontainers.image.url="https://github.com/rmoriz/openra-dockerfile"
# LABEL org.opencontainers.image.documentation="https://github.com/rmoriz/openra-dockerfile#readme"
# LABEL org.opencontainers.image.version=${OPENRA_RELEASE_TYPE}-${OPENRA_RELEASE_VERSION}
# LABEL org.opencontainers.image.licenses="GPL-3.0"
# LABEL org.opencontainers.image.authors="Roland Moriz"

ENTRYPOINT ["/$BIN"]