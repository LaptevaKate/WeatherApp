//
//  ViewController.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 13.06.22.
//

import UIKit
import MapKit
import CoreLocation


class WeatherViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var ProbabilityOfPrecipitationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var dailyForecastTableView: UITableView!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
 
    var forecastCollectionViewCell = ForecastCollectionViewCell()
    var daysWeatherTableViewCell = DaysTableViewCell()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        
    
    }
}


//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressedButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Enter any city Name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            //            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

