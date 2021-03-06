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
    let visibility: Double
    let maxTemp: Double
    let minTemp: Double
    let uv: Double
    let weather: Weather
    
    enum CodingKeys: String, CodingKey {
        case date = "valid_date"
        case temp = "temp"
        case windSpeed = "wind_spd"
        case pressure = "pres"
        case cloudsCoverage = "clouds"
        case visibility = "vis"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case uv = "uv"
        case precipitation = "pop"
        case weather
    }
    
    var precipitationString: String {
        return String(precipitation)
    }
    
    var temperatureString: String {
        return String(format: "%.0f", temp.rounded())
    }
    
    var formattedDate: Date? {
        DateFormatter.fulldate.date(from: date)
    }
    
    var day: Int {
        formattedDate?.day ?? 0
    }
    
    var month: String {
        formattedDate?.monthName() ?? ""
    }
    
    var formattedFullDate: String {
        "\(day) \(month)"
    }
}

struct Weather: Codable {
    let icon: String
    let code: Int
    let description: String
    
    var weatherImage: UIImage? {
        switch icon {
        default:
            return UIImage(named: "\(icon)")
        }
    }
}
