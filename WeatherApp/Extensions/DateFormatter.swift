//
//  DateFormatter.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 26.06.22.
//

import Foundation

extension DateFormatter {
    static let fulldate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()
}
