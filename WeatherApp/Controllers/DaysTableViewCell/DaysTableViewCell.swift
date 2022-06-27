//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
   static let reuseIdentifier = "DaysTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContentView.layer.cornerRadius = 20
        cellContentView.layer.borderWidth = 0.5
        cellContentView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }

    func configure(dateString: String, image: UIImage?, tempString: String, description: String) {
        dateLabel.text = dateString
        iconImageView.image = image
        degreesLabel.text = tempString
        descriptionLabel.text = description
    }
}
