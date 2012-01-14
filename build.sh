#!/bin/bash
#set -x

function install_bundler {
  gem sources | grep "http://rubygems.org/" > /dev/null || gem sources -a http://rubygems.org/ && \
  gem sources | grep "http://gems.rubyforge.org/" > /dev/null || gem sources -a http://gems.rubyforge.org/ && \
  gem install bundler --no-ri --no-rdoc
}

function check_bundler {
	which bundle | grep 1.8.7-p352 > /dev/null || install_bundler
}

function check_brew {
	which brew || ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
}

function check_node{
	which node || brew install node
}

function check_mogodb{
	which mongodb || brew install mongodb
}

function check_express{
	which express || npm install -g express
}

function check_gems{
	bundle update 
	bundle install
}

function check_env {
	check_bundler
	check_brew
	check_node
    check_mongodb
	check_express
	check_gems
}

function show_help {
  echo "Usage: build.sh [COMMAND]"
  echo ""
  echo "COMMAND:"
  echo -e "  check_env: check and install bundler\breww\node\express\mogodb and other gems"
}

function main {
	case $1 in
		check_env) check_env;;
		*) show_help ; exit 1;;
	esac
}

main $@
