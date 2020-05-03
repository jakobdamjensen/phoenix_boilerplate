#!/bin/zsh

user="app"
remote="some_production_server_prod_1"
version=$(git describe --abbrev=0 --tags) #$(head -n 1 VERSION)
tmp_path="/home/ubuntu/releases/payloads"
home_dir="/home/$user"
work_dir="$home_dir/releases"
release_filename="release-$version.tar.gz"
static_files_filename="static_files-$version.tar.gz"
destination_path="$work_dir/$release_filename"
destination_folder="$work_dir/releases/$version"
static_files_destination_folder="$destination_folder/static"
app_container_path=/var/lib/app
app_envvar_path="$app_container_path/envvars"
app_path="$app_container_path/current"
app_static_root_path="$app_container_path/current_root"

echo "--- PREPARE SERVER"
ssh $remote mkdir -p $tmp_path
ssh $remote sudo mkdir -p $app_container_path
ssh $remote sudo chown -R $user $app_container_path
ssh $remote sudo chgrp -R $user $app_container_path
ssh $remote sudo mkdir -p $work_dir
ssh $remote sudo chown -R $user $work_dir
ssh $remote sudo chgrp -R $user $work_dir
ssh $remote sudo mkdir -p $destination_folder
ssh $remote sudo mkdir -p $static_files_destination_folder
