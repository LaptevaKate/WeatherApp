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
    @IBOutlet weak var probabilityOfPrecipitationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var dailyForecastTableView: UITableView! {
        didSet {
            dailyForecastTableView.register(UINib(nibName: String(describing: DaysTableViewCell.self), bundle: nil), forCellReuseIdentifier: DaysTableViewCell.reuseIdentifier)
        }
    }
    @IBOutlet weak var forecastCollectionView: UICollectionView! {
        didSet {
            forecastCollectionView.register(UINib(nibName: String(describing: ForecastCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier)
        }
    }
    
    let locationManager = CLLocationManager()
    
    var weatherManager = WeatherManager()
    var weatherModel: WeatherModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.requestLocation()
            default:
                self.weatherManager.fetchWeather(cityName: "Minsk")
            }
        }
        
        dailyForecastTableView.dataSource = self
        dailyForecastTableView.delegate = self
        
        forecastCollectionView.dataSource = self
        forecastCollectionView.delegate = self
        
        searchTextField.delegate = self
        
    }
}

//MARK: - TableView Delegate & DataSource
extension WeatherViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = weatherModel?.data else { return 1 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DaysTableViewCell.reuseIdentifier) as! DaysTableViewCell
        if let data = weatherModel?.data[indexPath.row] {
            
            cell.configure(dateString: data.formattedFullDate,
                           image: data.weather.weatherImage,
                           tempString: String(data.temp),
                           description: data.weather.description)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

//MARK: - CollectionView Delegate & DataSource, FlowLayout
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = weatherModel?.data else { return 1 }
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier, for: indexPath) as! ForecastCollectionViewCell
        
        if let data = weatherModel?.data[indexPath.row]  {
            cell.configure(dateString: data.formattedFullDate,
                           windString: "Wind speed: \(data.windSpeed) m/s",
                           pressureString: "Pressure: \(data.pressure) mb",
                           cloudString: "Cloud coverage: \(data.cloudsCoverage)%")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}

//MARK: - CLLocationManagerDelegate


extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
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
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}
//MARK: - WeatherManagerDelegate


extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherModel = weather
            self.dailyForecastTableView.reloadData()
            self.forecastCollectionView.reloadData()
            
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.data[1].temperatureString
            self.probabilityOfPrecipitationLabel.text = "Probability Of Precipitation \( weather.data[5].precipitationString) %"
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}
