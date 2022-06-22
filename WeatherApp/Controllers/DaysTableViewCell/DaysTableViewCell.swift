//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 21.06.22.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBOutlet weak var daysTableViewCell: UIView!
    @IBOutlet weak var dateLabelOfDaysTableViewCell: UILabel!
    @IBOutlet weak var imageViewOfDaysTableViewCell: UIImageView!
    @IBOutlet weak var degreesLabelOfDaysTableViewCell: UILabel!
    @IBOutlet weak var descriptionLabelOfTableViewCell: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
