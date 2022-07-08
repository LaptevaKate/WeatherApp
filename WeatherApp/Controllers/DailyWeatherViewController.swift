//
//  DailyForecastViewController.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 7.07.22.
//

import UIKit

class DailyWeatherViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var uvLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var maxDegreesLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var minDigreesLabel: UILabel!
    
    // MARK: - Private properties
    
    var weather: WeatherData?
    var city: String?
    var index = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        maxTempLabel.text = NSLocalizedString("max.temp", comment: "")
        minTempLabel.text = NSLocalizedString("min.temp", comment: "")
        
        showForecast(for: index)
    }
    
    // MARK: - Private Methods
    
    func showForecast(for index: Int) {
        if (index > -1) && (index < weather?.day ?? 0) {
            let dateFormetter = DateFormatter()
            dateFormetter.dateFormat = "yyyy-MM-dd"
            if let string = weather?.date {
                if let date = dateFormetter.date(from: string) {
                    dateFormetter.dateFormat = "MMM d, yyyy"
                    dateLabel.text = dateFormetter.string(from: date)
                }
            }
            if (weather?.visibility) != nil {
                visibilityLabel.text = String.localizedStringWithFormat(NSLocalizedString("visability", comment: ""), String(weather?.visibility ?? 0))
            }
            if (weather?.uv) != nil {
                uvLabel.text = String.localizedStringWithFormat(NSLocalizedString("uv", comment: ""), String(weather?.uv ?? 0))
            }
            if let maxTemp = weather?.maxTemp {
                maxDegreesLabel.text = "\(maxTemp)"
            }
            if let minTemp = weather?.minTemp {
                minDigreesLabel.text = "\(minTemp)"
            }
            cityNameLabel.text = city
        }
    }

    // MARK: - IBActions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
