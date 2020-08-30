#!/bin/bash

function addProperty() {
  local path=$1
  local name=$2
  local value=$3

  local entry="$name = ${value}"
  local escapedEntry=$(echo $entry | sed 's/\//\\\//g')
  sed -i "/# >> END/ s/.*/${escapedEntry}\n&/" $path
}

function configure_tipboard() {
    local path=$1
    local module=$2
    local envPrefix=$3

    local var
    local value

    echo "Configuring $module"
    for c in `printenv | perl -sne 'print "$1 " if m/^${envPrefix}_(.+?)=.*/' -- -envPrefix=$envPrefix`; do
        name=`echo ${c} | tr '[:lower:]' '[:upper:]'`
        var="${envPrefix}_${c}"
        value=${!var}
        echo " - Setting $name=$value"
        addProperty $path $name "$value"
    done
}

configure_tipboard /root/.tipboard/settings-local.py tipboard TIPBOARD

cp /dashboards/* /root/.tipboard

exec $@
