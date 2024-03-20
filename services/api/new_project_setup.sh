#!/bin/bash

read -p "Do you want to replace default values in app configuration files? [y/N] " app_configuration
if [ "$app_configuration" != "${app_configuration#[Yy]}" ] ;then

  # Getting and converting the project name to the correct format
  read -p "Enter the project name: " project_name
  project_name=$(echo "$project_name" | sed -r 's/[\ \!\@\#\$\%\^\&\*\(\)\-\+\=\?\.\,\<\>]+/_/g')
  project_name=$(echo "$project_name" | tr '[:upper:]' '[:lower:]')
  if [[ $project_name == "" ]]; then
    echo "Project name can't be empty"
    exit 1
  fi

  # Setting an application name in a project
  search='new_project_name'
  echo "'$search' marker was found and replaced with '$project_name' in files:"
  grep --include={*.rb,*.yml,*.erb} -rl $search .
  grep --include={*.rb,*.yml,*.erb} -rl $search . | xargs sed -i '' -e "s/$search/$project_name/g"
  echo

  # Setting DB name in a project config files
  search='new_project_db_name'
  read -p "Specify DB Name (without '_development' or '_test' postfix, only [a-zA-Z_-] symbols are allowed) [$project_name]: " db_name
  db_name=${db_name:-$project_name}
  if [[ $db_name != "" ]]; then
    echo "'$search' marker was found and replaced with '$db_name' in files:"
    grep --include="*.yml" -rl $search .
    grep --include="*.yml" -rl $search . | xargs sed -i '' -e "s/$search/$db_name/g"
    echo
  fi

  # Setting docker containers prefix in a project config files
  search='new_project_container_prefix'
  read -p "Specify Docker containers prefix (only [a-zA-Z0-9][a-zA-Z0-9_.-] symbols are allowed) [$project_name]: " docker_prefix
  docker_prefix=${docker_prefix:-$project_name}
  if [[ $docker_prefix != "" ]]; then
    echo "'$search' marker was found and replaced with '$docker_prefix' in files:"
    grep --include={*.yml,*.json} -rl $search .
    grep --include={*.yml,*.json} -rl $search . | xargs sed -i '' -e "s/$search/$docker_prefix/g"
    echo
  fi

  # Setting port for dev environment
  search='new_project_dev_app_port'
  read -p "Specify port for development env (only numeric value is allowed) [3000]: " dev_port
  dev_port=${dev_port//[!0-9]/}
  dev_port=${dev_port:-'3000'}
  if [[ $dev_port != "" ]]; then
    echo "'$search' marker was found and replaced with '$dev_port' in files:"
    grep --include={*.yml,*.json,*.rb,*.dev} -rl $search .
    grep --include={*.yml,*.json,*.rb,*.dev} -rl $search . | xargs sed -i '' -e "s/$search/$dev_port/g"
    echo
  fi

  # Setting port for test environment (cypress)
    search='new_project_test_app_port'
    read -p "Specify port for Cypress and test env (only numeric value is allowed) [5002]: " test_port
    test_port=${test_port//[!0-9]/}
    test_port=${test_port:-'5002'}
    if [[ $test_port != "" ]]; then
      echo "'$search' marker was found and replaced with '$test_port' in files:"
      grep --include={*.yml,*.js} -rl $search .
      grep --include={*.yml,*.js} -rl $search . | xargs sed -i '' -e "s/$search/$test_port/g"
      echo
    fi
fi

read -p "Do you want to install dependencies and build the application? [y/N] " app_build
if [ "$app_build" != "${app_build#[Yy]}" ] ;then
  cp -n .env.example .env

  echo 'Configuring cypress host machine dependencies...'
  asdf install
  bundle install
  yarn install --ignore-engines
  yarn cypress install
  echo 'Configuring cypress host machine dependencies has finished'
  echo

  echo 'Application build has started...'
  docker-compose build
  docker-compose run --rm web bash -c "bundle exec rake db:setup && bundle exec rake db:test:prepare && yarn install"
  docker-compose up --detach
  echo 'Application build has finished'
  echo

  echo 'Application Health Testing start...'
  yarn test:cypress:headless
  docker-compose down
  echo 'Application Health Testing has finished'
fi