#/bin/sh
apk add bash go make git gnupg musl-dev openssl util-linux tar
git clone https://github.com/NetApp/trident
export GOARCH=ppc64le
export GOOS=linux
makefiles modification....
cd trident
sed -i 's/^GO_LINUX = ${DR_LINUX} ${GO_CMD}/GO_LINUX = \$\{GO_CMD\}/' Makefile
sed -i 's/^TRIDENT_VOLUME_PATH = \/go\/src\/github.com\/netapp\/trident/TRIDENT_VOLUME_PATH = ${ROOT}/' Makefile
sed -i 's/docker build/docker buildx build --platform linux\/ppc64le/' Makefile
make trident_build
