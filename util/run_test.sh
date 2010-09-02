#!/bin/bash
script_dir=$(dirname $0)
root=$(readlink -f $script_dir/..)
testfile=${1:-$root/t/*.t}
cd $root
$script_dir/reindex $root/t/*.t
export PATH=$root/work/sbin:$PATH
killall nginx
prove -I$root/../test-nginx/lib $testfile

