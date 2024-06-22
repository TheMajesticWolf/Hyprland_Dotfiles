import requests
import json
import sys 

def get_weather(city, country):
	#sys.stdout.write(json.dumps({
	#	"text": f"45°C",
	#	"tooltip": f"45°C - ⛅️\nHumidity: 21%\nFeels like: 48°C\nTesting!!",

	#}))
	#sys.stdout.flush()
	#exit(0)
	try:
		url = f"https://wttr.in/{city}+{country}?format=j1"
		response = requests.get(url).json()
		return response
	except Exception as e:
		sys.stdout.write(json.dumps({"text": "-273.15°C", "tooltip": "Error fetching info"}))
		sys.stdout.flush()
		exit(0)


city = "Hyderabad"
country = "India"
weather_codes = {
    '113': '☀️',
    '116': '⛅️',
    '119': '☁️',
    '122': '☁️',
    '143': '🌫',
    '176': '🌦',
    '179': '🌧',
    '182': '🌧',
    '185': '🌧',
    '200': '⛈',
    '227': '🌨',
    '230': '❄️',
    '248': '🌫',
    '260': '🌫',
    '263': '🌦',
    '266': '🌦',
    '281': '🌧',
    '284': '🌧',
    '293': '🌦',
    '296': '🌦',
    '299': '🌧',
    '302': '🌧',
    '305': '🌧',
    '308': '🌧',
    '311': '🌧',
    '314': '🌧',
    '317': '🌧',
    '320': '🌨',
    '323': '🌨',
    '326': '🌨',
    '329': '❄️',
    '332': '❄️',
    '335': '❄️',
    '338': '❄️',
    '350': '🌧',
    '353': '🌦',
    '356': '🌧',
    '359': '🌧',
    '362': '🌧',
    '365': '🌧',
    '368': '🌨',
    '371': '❄️',
    '374': '🌧',
    '377': '🌧',
    '386': '⛈',
    '389': '🌩',
    '392': '⛈',
    '395': '❄️'
}

response = get_weather(city, country)


temp = response["current_condition"][0]["temp_C"]
humidity = response["current_condition"][0]["humidity"]
icon = weather_codes[response["current_condition"][0]["weatherCode"]]
feels_like = response["current_condition"][0]["FeelsLikeC"]

sys.stdout.write(json.dumps({
	"text": f"{temp}°C",
	"tooltip": f"{temp}°C - {icon}\nHumidity: {humidity}%\nFeels like: {feels_like}°C"

}))
sys.stdout.flush()
