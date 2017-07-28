#! /usr/bin/env bash

# https://gist.github.com/domenic/ec8b0fc8ab45f39403dd#sign-up-for-travis-and-add-your-project

# Only deply on master branch
SOURCE_BRANCH="master"
BUILD_VERSION="8"

echo "Node version: $TRAVIS_NODE_VERSION"

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH"  -o "$TRAVIS_NODE_VERSION" != "$BUILD_VERSION" ]; then
  echo "Skip deploy, TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST, TRAVIS_BRANCH=$TRAVIS_BRANCH, NODE_VERSION=$TRAVIS_NODE_VERSION"
  exit 0
fi

echo 'Done.'

# kill ssh-agent
