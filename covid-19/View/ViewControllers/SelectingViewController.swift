//
//  SelectingViewController.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class SelectingViewController: UIViewController{
    
    var countrys: [CountryModelObject]! = []
    var filteredCountrys: [CountryModelObject]! = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var networkManager: NetworkManager!
    
    var tableVCdelegate: MainTableViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

        tableView.delegate = self
        tableView.dataSource = self
        
        networkManager = NetworkManagerImplementation()
        DispatchQueue.main.async {
            self.getCountrys()
        }
        
        self.tableView.tableHeaderView = searchBar
    }
    
    func getCountrys(){
        networkManager.getListOfCountries { (result) in
            switch result{
            case .failure(let error):
                print("ALLCOUNTRIES ERROR: \(error)")
            case .success(let array):
                self.countrys = array
                self.filteredCountrys = array
                self.tableView.reloadData()    
            }
        }
    }
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
}

extension SelectingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = flag(country: filteredCountrys[indexPath.row].alpha2code ?? "kz") + " " + filteredCountrys[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        networkManager.getDataCountry(country: filteredCountrys[indexPath.row].alpha2code!) { (response) in
            switch response{
            case .failure(let error):
                print("DATACOUNTRY ERROR \(error)")
            case .success(let currentCountry):
                DispatchQueue.main.async {
                    LocalDataManagerImplementation.shared.saveCountryData(country: currentCountry)
                    self.tableVCdelegate.setSelectedCountry(country: currentCountry)
                }
            }
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
}

extension SelectingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCountrys = []
        
        if searchText == "" {
            filteredCountrys = countrys
        }
        else {
            for country in countrys {
                if country.name.lowercased().contains(searchText.lowercased()) {
                    filteredCountrys.append(country)
                }
            }
        }
        self.tableView.reloadData()
    }
}
