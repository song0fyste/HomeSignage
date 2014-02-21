#!/bin/env ruby
# -*- coding: utf-8 -*-
require "time"

def getTrash(date)
	
	y = Time.parse(date).wday

	m = "fire"
	n = "nofire"
	s = "sigen"
	t = "other"

	case y
	when 0  #日曜
		ref = t
	when 1  #月曜
		ref = m
	when 2  #火曜
		ref = s
	when 3  #水曜
		ref = m
	when 4  #木曜
		ref = t
	when 5  #金曜
		ref = m
	when 6  #土曜
		days = Time.parse(date).day
		#第２・４のみ
		#日付を7で割って１あまり１以上 または　７で割って２あまり０　なら第２
		#日付を7で割って３あまり１以上 または　７で割って４あまり０　なら第４
		d = days / 7
		a = days % 7
		case d
		when 0
			ref = t
		when 1
			if a == 0 then
				ref = t
			else
				ref = n
			end
		when 2
			if a == 0 then
				ref = n
			else
				ref = t
			end
		when 3
			if a == 0 then
				ref = t
			else
				ref = n
			end
		when 4
			if a == 0 then
				ref = n
			else
				ref = t
			end
		end
	end

	return ref
end

def getTrashText(cls)
	m = "fire"
	n = "nofire"
	s = "sigen"
	t = "other"

	case cls
	when m
		ref = '燃えるゴミの日'
	when n
		ref = '燃えないゴミの日'
	when s
		ref = '資源ごみの日'
	when t
		ref = '特になし'
	end

	return ref
end

#puts getTrash("2014/01/14")


