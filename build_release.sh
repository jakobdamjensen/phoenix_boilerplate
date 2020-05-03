#!/bin/zsh

version=$(git describe --abbrev=0 --tags) #$(head -n 1 VERSION)
static_files_filename="static_files-$version.tar.gz"

rm -f TMP_VERSION
echo $version > TMP_VERSION

echo "--- BUILD $version INSIDE DOCKER CONTAINER"
docker build -t phoenix_boilerplate-builder .
docker run -v $PWD/build_output:/build_output phoenix_boilerplate-builder cp release.tar.gz /build_output/release-$version.tar.gz
docker run -v $PWD/build_output:/build_output phoenix_boilerplate-builder cp static_files.tar.gz /build_output/static_files-$version.tar.gz

echo "--- COPY $version STATIC FILES TO priv/static"
rm -rf priv/static
mkdir priv/static
tar -C priv/static -xf build_output/$static_files_filename
mv priv/static/app/priv/static/* priv/static
rm -rf priv/static/app
