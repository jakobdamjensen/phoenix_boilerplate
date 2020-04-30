cd builder_docker_setup
docker image build -t phoenix_boilerplate-elixir:latest .
cd ..
docker build -t phoenix_boilerplate-builder .