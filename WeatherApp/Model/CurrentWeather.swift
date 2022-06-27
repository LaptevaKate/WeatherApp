//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 27.06.22.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let precipitation: Int
    var precipitationString: String {
        return String(precipitation)
    }
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature.rounded())
    }
    
    init?(weatherModel: WeatherModel) {
        cityName = weatherModel.cityName
        temperature = weatherModel.data[1].temp
        precipitation = weatherModel.data[5].precipitation
    }
}
