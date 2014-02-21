#!/bin/env ruby
# -*- coding: utf-8 -*-
require 'nokogiri'

def loadWeatherXml
	f = File.open("./data/13.xml")
	doc = Nokogiri::XML(f)
	f.close

	return doc
end

def getWeather(date)
	doc = loadWeatherXml

	#puts doc.at_css("#lblNewTime")
	#puts doc.xpath("//area[@id='東京地方']/info[@date='2013/11/04']/weather")
	
	nod = doc.xpath("//area[@id='東京地方']/info[@date='#{date}']/weather").text
	#puts nod

	return nod
end

def getTemp(date , which)
	doc = loadWeatherXml

	ref = doc.xpath("//area[@id='東京地方']/info[@date='#{date}']/temperature/range[@centigrade='#{which}']").text
	#puts doc.xpath("//area[@id='東京地方']/info[@date='2013/11/04']/temperature/range[@centigrade='max']").text

	return ref	
end

def getRainfall(date , period)
	doc = loadWeatherXml

	ref = doc.xpath("//area[@id='東京地方']/info[@date='#{date}']/rainfallchance/period[@hour='#{period}']").text
	#puts doc.xpath("//area[@id='東京地方']/info[@date='2013/11/04']/temperature/range[@centigrade='max']").text

	return ref	
end

def getPic(weather)
	#雪または雨は優先する　雪優先
	if weather.index('雪') then
		ref = 'W'
	elsif weather.index('雨') then
		ref = 'R'
	elsif weather.index('晴') then
		ref = 'J'
	elsif weather.index('く') then
		ref = 'N'
	else
		#その他は霧
		ref = 'M'
	end

	return ref
end

