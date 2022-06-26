//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
   static let reuseIdentifier = "DaysTableViewCell"

    func configure(dateString: String, image: UIImage?, tempString: String, description: String) {
        dateLabel.text = dateString
        iconImageView.image = image
        degreesLabel.text = tempString
        descriptionLabel.text = description
    }
}
