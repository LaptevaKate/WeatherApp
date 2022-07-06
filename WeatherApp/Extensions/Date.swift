//
//  Date.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 26.06.22.
//

import Foundation

extension Date {
    var day: Int? {
        Calendar.current.dateComponents([.day], from: self).day
    }
    
    func monthName() -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: Locale.preferredLanguages.first ?? "en_US_POSIX")
        df.setLocalizedDateFormatFromTemplate("MMM")
        return df.string(from: self)
    }
}
