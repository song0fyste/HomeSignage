require 'sinatra'
require 'sinatra/reloader'

require './rb/weather.rb'
require './rb/trash.rb'


#外部からも4567ポートでつながるようにする
set :environment, :production

get '/' do
	"Hello world"
end

get '/weather' do
	t = Time.now.strftime("%Y/%m/%d")
	@today = t
	@tweather = getWeather(t)
	@tmax = getTemp(t,"max")
	@tmin = getTemp(t,"min")
	@t00 = getRainfall(t , "00-06")
	@t06 = getRainfall(t , "06-12")
	@t12 = getRainfall(t , "12-18")
	@t18 = getRainfall(t , "18-24")
	@tpic = getPic(@tweather)

	n = Date.today.next.strftime("%Y/%m/%d")
	@nextday = n
	@nweather = getWeather(n)
	@nmax = getTemp(n,"max")
	@nmin = getTemp(n,"min")
	@n00 = getRainfall(n , "00-06")
	@n06 = getRainfall(n , "06-12")
	@n12 = getRainfall(n , "12-18")
	@n18 = getRainfall(n , "18-24")
	@npic = getPic(@nweather)

	erb :weather
end

get '/trash' do
	t = Time.now.strftime("%Y/%m/%d")
	tom = (Time.now + (60 * 60 * 24)).strftime("%Y/%m/%d")
	@today = t
	@time = Time.now.strftime("%H:%M")

	gettoday = getTrash(t)
	gettomo = getTrash(tom)

	@todayTrash = getTrashText(gettoday)
	@tommorowTrash = getTrashText(gettomo)
	@todayTrashCls =  gettoday
	@tommorowTrashCls = gettomo
end

get '/portal' do
	t = Time.now.strftime("%Y/%m/%d")
	tom = (Time.now + (60 * 60 * 24)).strftime("%Y/%m/%d")
	@today = t
	@time = Time.now.strftime("%H:%M")

	gettoday = getTrash(t)
	gettomo = getTrash(tom)

	@todayTrash = getTrashText(gettoday)
	@tommorowTrash = getTrashText(gettomo)
	@todayTrashCls =  gettoday
	@tommorowTrashCls = gettomo

	@tweather = getWeather(t)
	@tmax = getTemp(t,"max")
	@tmin = getTemp(t,"min")
	@t00 = getRainfall(t , "00-06")
	@t06 = getRainfall(t , "06-12")
	@t12 = getRainfall(t , "12-18")
	@t18 = getRainfall(t , "18-24")
	@tpic = getPic(@tweather)

	n = Date.today.next.strftime("%Y/%m/%d")
	@nextday = n
	@nweather = getWeather(n)
	@nmax = getTemp(n,"max")
	@nmin = getTemp(n,"min")
	@n00 = getRainfall(n , "00-06")
	@n06 = getRainfall(n , "06-12")
	@n12 = getRainfall(n , "12-18")
	@n18 = getRainfall(n , "18-24")
	@npic = getPic(@nweather)
	erb :portal
end

