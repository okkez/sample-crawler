#!/bin/sh

MAIN=$1
case $MAIN in
  crawler|processor)
    bundle exec daimon_skycrawlers exec $MAIN || sleep 600
    ;;
  setup)
    bundle install --path=vendor/bundle
    bundle exec rake db:setup
    ;;
  none)
    echo NOP
    ;;
esac
