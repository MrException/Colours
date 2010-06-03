#!/bin/bash

#cp = ""
#for JAR in `ls ./lib/`;
#do
    #cp=$JAR:$cp;
#done;
cp="$(find -H ./lib/ -mindepth 1 -maxdepth 1 -print0 | tr \\0 \:)"

echo $cp
java -cp $cp com.martiansoftware.nailgun.NGServer 127.0.0.1
