//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBOutlet weak var daysTableViewCell: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconsImageView: UIImageView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "DaysTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
