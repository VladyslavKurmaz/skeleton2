# README

* Rails 7.0.2
* Ruby 3.1.2
* Dev Dockerfile and Docker Compose configuration
* PostgreSQL
* Tailwind
* Flowbite

## Requirements 
Make sure you have Docker and Nodejs 14 or higher installed.

## Initial dev setup and check local env
```
cp .env.example .env
yarn dev:build
yarn db:setup
yarn dev:yarn:install
yarn dev:start
yarn test:cypress:headless
```

## Running the Rails app with Tailwind and Esbuild assets compilation in "watch" mode
```
yarn dev:start
```

## Running the Rails console
```
yarn dev:console
```

## Running DB migrations
```
yarn db:migrate
```

## Running Yarn install
```
yarn dev:yarn:install
```

## Running Rubocop check
```
yarn dev:lint
```

## Running Rspec unit tests
```
yarn test:unit
```
## Running Cypress Tests (E2E)
Run Cypress tests in interactive mode
```
yarn test:cypress:interactive
```
Run Cypress tests in headless mode
```
yarn test:cypress:headless
```

## Measuring test coverage
Run tests with enabled coverage measuring
```
# All tests
yarn test:all

# Only unit tests
test:unit

# Only E2E tests
test:cypress:headless
```
Coverage report
```
test:coverage:open
test:coverage:clear
```

## Debugging
Attach your terminal to the container:
```
yarn dev:debug
```

To start Ngrok local HTTP tunnel
```
yarn dev:ngrok 
```

## Deploy
Check capistrano deploy config for staging
```
yarn deploy:check:staging
```

Deploying **main** branch to staging server
```
yarn deploy:staging
```

Rollback staging deploy
```
yarn deploy:staging:rollback
```

## General info
List of all available development commands is in the file ./package.json

## Setting up Cypress Tests
Ruby and Nodejs should be installed on the local machine to run the tests. You can use any method convenient for you to install. We recommend using asdf tool version manager. https://asdf-vm.com/guide/getting-started.html 

After installation asdf, you need to run a few commands:

```
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install
```

Also, to run the tests, cypress must be installed
```
yarn cypress install
```

You may also need to run bundler and migrations for the test environment
```
bundle install
yarn test:migrate
```
