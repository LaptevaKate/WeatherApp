//
//  SaveFavouriteCities.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 10.07.22.
//

import Foundation

enum SaveKeys: String {
    case city
}

class SaveFavouriteCities {
    
    private let defaults = UserDefaults.standard
    
    public static var shared = SaveFavouriteCities()
    
    var city: [String] {
        get {
            guard let value = defaults.stringArray(forKey: SaveKeys.city.rawValue) else { return [] }
            return value
        }
        set {
            defaults.setValue(newValue, forKey: SaveKeys.city.rawValue)
        }
    }
}
