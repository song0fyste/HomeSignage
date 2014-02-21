#!/bin/sh

curl -O http://www.drk7.jp/weather/xml/13.xml
mv -f 13.xml /home/share/sinatra/data/
