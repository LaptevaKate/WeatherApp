//
//  FavouriteCitiesViewController.swift
//  WeatherApp
//
//  Created by Екатерина Лаптева on 9.07.22.
//

import UIKit

protocol FavouriteCitiesViewControllerDelegate: AnyObject {
    func didSelectCity(city: String)
}

final class FavouriteCitiesViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var favouriteCitiesTableView: UITableView!
    
    // MARK: - Properties
    
    var citiesNameArray: [String] = SaveFavouriteCities.shared.city {
        willSet {
            SaveFavouriteCities.shared.city = newValue
        }
        didSet {
            favouriteCitiesTableView.reloadData()
        }
    }

    weak var delegate: FavouriteCitiesViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        favouriteCitiesTableView.delegate = self
        favouriteCitiesTableView.dataSource = self

        backButton.setTitle(NSLocalizedString("back.button", comment: ""), for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func addCity(_ sender: Any) {
        let title = NSLocalizedString("saving.cities", comment: "")
        let message = NSLocalizedString("add.citiesName", comment: "")
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = NSLocalizedString("city.name", comment: "")
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                                         style: .cancel,
                                         handler: nil)
        
        let okAction = UIAlertAction(title: NSLocalizedString("ок", comment: ""), style: .default) { [weak self] action in
            guard let self = self, let text = alert.textFields?.first?.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
            self.citiesNameArray.append(text)
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - TableView Delegate & DataSource

extension FavouriteCitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesNameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityNameCell", for: indexPath)
        let cities = citiesNameArray[indexPath.row]
        cell.textLabel?.text = "\(cities)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        citiesNameArray.remove(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = citiesNameArray[indexPath.row].trimmingCharacters(in: .whitespaces)
        delegate?.didSelectCity(city: city)
    }
}
