//
//  ForecastCollectionViewCell.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var forecastView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cloudCoverageLabel: UILabel!
    
    static let reuseIdentifier = "ForecastCollectionViewCell"
    
    func configure(dateString: String, windString: String, pressureString: String, cloudString: String) {
        dateLabel.text = dateString
        windSpeedLabel.text = windString
        pressureLabel.text = pressureString
        cloudCoverageLabel.text = cloudString
    }
}
