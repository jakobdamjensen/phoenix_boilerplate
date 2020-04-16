# PhoenixBoilerplate

## What is this?

This project is a simple boilerplate repository. It allows you to quickly clone and has all the necessary basic stuff configured so you can focus on building your product.

### What is working

  * Docker compose database
  * CircleCI Configuration to run elixir tests & build production assets
  * Authentication with POW
  * Easy renaming script
  * Typescript webpack configuration
  * SCSS/SASS webpack configuration
  * Stimulus for handing javascript
  * Bulma styling

### What is coming

  * Custom POW templates
  * A simple admin area
  * User roles
  * Stripe payment processing
  * Mailer support using Bamboo
  * Deployment scripts

# How to rename the project (on Linux & macOS)

  * Install [ack](https://beyondgrep.com)
  * Change `NEW_NAME` & `NEW_OPT` in `rename_project.sh`
  * Make `rename_project.sh` executeable: `chmod u+x rename_project.sh`
  * Execute `rename_project.sh`: `./rename_project.sh`

# Setup environment

## Development database
  * Install Docker
  * run `docker-compose up` to start the development database
  
## Elixir & Phoenix
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && yarn`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
