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

echo "--- COPY $version FILES TO SERVER"
scp build_output/$release_filename $remote:$tmp_path/$release_filename
scp build_output/$static_files_filename $remote:$tmp_path/$static_files_filename

echo "--- MOVE $version FILES TO PROPER DESTINATIONS"
ssh $remote sudo tar -C $destination_folder -xf $tmp_path/$release_filename
ssh $remote sudo tar -C $static_files_destination_folder -xf $tmp_path/$static_files_filename

ssh $remote sudo chown -R $user $destination_folder
ssh $remote sudo chgrp -R $user $destination_folder

ssh $remote sudo chown -R $user $static_files_destination_folder
ssh $remote sudo chgrp -R $user $static_files_destination_folder

echo "--- MAKE SYMLINKS POINT TO $version"
ssh $remote sudo rm -f $app_path
ssh $remote sudo ln -s $destination_folder/app/_build/prod/rel/phoenix_boilerplate $app_path
ssh $remote sudo rm -f $app_static_root_path
ssh $remote sudo ln -s $static_files_destination_folder/app/priv/static $app_static_root_path
ssh $remote sudo rm -f $app_envvar_path
ssh $remote sudo ln -s $home_dir/envvars $app_envvar_path
ssh $remote sudo rm -f $app_upload_path

ssh $remote sudo chown -R $user $app_path
ssh $remote sudo chgrp -R $user $app_path

echo "--- RESTART APPLICATION"
ssh $remote sudo systemctl restart phoenix_boilerplate_app

echo "--- DONE"