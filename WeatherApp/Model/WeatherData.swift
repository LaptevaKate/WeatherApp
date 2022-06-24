//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

struct WeatherModel: Codable {
    let cityName: String
    let data: [WeatherData]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case data
    }
}

struct WeatherData: Codable {
    let date: String
    let temp: Double
    let windSpeed: Double
    let pressure: Double
    let cloudsCoverage: Int
    let precipitation: Int
    let weather: Weather
    
    enum CodingKeys: String, CodingKey {
        case date = "valid_date"
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
    let code: Int
    let description: String
}
