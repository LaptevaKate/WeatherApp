//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

struct WeatherData: Codable {
    let cityName: String
    let data: [Data]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case data
    }
}

struct Data: Codable {
    let datetime: Date
    let temp: Double
    let windSpeed: Double
    let pressure: Double
    let cloudsCoverage: Double
    let precipitation:Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case datetime = "datetime"
        case temp = "temp"
        case windSpeed = "wind_spd"
        case pressure = "pres"
        case cloudsCoverage = "clouds"
        case precipitation = "pop"
        case weather
    }
}

struct Weather: Codable {
    let icon: String
    let code: String
    let description: String
}
