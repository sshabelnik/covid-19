//
//  SelectingViewController.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class SelectingViewController: UIViewController{
    
    var countries: [CountryModelObject]?
    var filteredCountrys: [CountryModelObject]?
    
    var presenter: SelectingViewOutput!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tableVCdelegate: MainTableViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.tableHeaderView = searchBar
        
        DispatchQueue.main.async {
            self.presenter.getCountrys()
        }
    }
}

extension SelectingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countries = filteredCountrys else { return 0}
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let country = filteredCountrys?[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = presenter.flag(country: country.alpha2code ?? "kz") + " " + country.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.presenter.rowSelected(country: (self.filteredCountrys?[indexPath.row])!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension SelectingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCountrys = []
        
        if searchText == "" {
            filteredCountrys = countries
        }
        else {
            guard let countries = self.countries else { return }
            for country in countries {
                if country.name.lowercased().contains(searchText.lowercased()) {
                    self.filteredCountrys?.append(country)
                }
            }
        }
        self.tableView.reloadData()
    }
}

extension SelectingViewController: SelectingViewInput {
    func setAllCountries(countries: [CountryModelObject]) {
        self.countries = countries
        self.filteredCountrys = countries
        self.tableView.reloadData()
    }
    
    func setCurrentCountry(country: CountryDataModelObject) {
        self.tableVCdelegate.setSelectedCountry(country: country)
    }
}
