# WeatherApp
Graduate work for TechMeSkills    
:umbrella: :sunny: :closed_umbrella: 

## Requirements
- iOS 13+   
- Swift 5.0

### Description   
This is a Weather App project which aims to display weather information using MVC pattern in 'Swift'.    
16-days weather forecast getting data from "https://api.weatherbit.io/v2.0" and displaying it in CollectionView (horizontally) and TableView (vertically).    
:mag:    The name of the city for searching can be entered in TextField at the top of the screen or the city can be chosen from the MapView at the bottom.    
Loclization includes English and Russian languages.    
:sparkles:    The class WeatherViewController is the main one which shows the data about weather into cells for tableView (func cellForRowAt) and collectionView (func cellForItemAt) from WeatherModel structure.
In The WeatherManager Structure app fetches weather from cityName and location (CLLocationManager) by creatind URL, URLSession, session.dataTask. Parsing Json and fill Weather Model with weather Data.    
:sparkles:    The DailyWeatherViewController is responsible for detailing information about max and min temperatures, visibility and UV-index. Using UIView.animation termometrUIImageView can rotate.
:sparkles:    The FavouriteCitiesViewController is responsible for showing The Names of favourite cities that are saved in class SaveFavouriteCities (using UserDefaults) and returns User for the main VC updating information
