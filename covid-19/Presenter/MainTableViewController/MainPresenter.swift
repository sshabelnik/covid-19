//
//  MainPresenter.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainViewOutput {
    
    var networkManager: NetworkManager!
    weak var view: MainViewInput!
    var appDelegate: AppDelegate!
    
    func getData() {
        if (appDelegate.hasAlreadyLaunched) {
            LocalDataManagerImplementation.shared.getCountryData { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.view.setCurrentCountry(country: data)
                }
            }
            
            LocalDataManagerImplementation.shared.getWorldData { (result) in
                switch result {
                case.failure(let error):
                    print(error)
                case .success(let data):
                    self.view.setWorldData(data: data)
                }
            }
        }
        else {
            self.getAndSaveWorldData()
            self.getAndSaveCountryData()
        }

    }
    
    func prepareSegue(for segue: UIStoryboardSegue) {
        let destintaionViewController = segue.destination as!  SelectingViewController
        destintaionViewController.tableVCdelegate = self
    }
    
    func getAndSaveWorldData() {
        self.networkManager.getWorldData { (result) in
            switch result{
            case.failure(let error):
                print("Getting WorldData error: \(error)")
            case.success(let data):
                LocalDataManagerImplementation.shared.saveWorldData(data: data)
                self.view.setWorldData(data: data)
            }
        }
    }
    
    func getAndSaveCountryData() {
        self.networkManager.getDataCountry(country: "RU") { (result) in
            switch result {
            case .failure(let error):
                print("Getting countryData error: \(error)")
            case .success(let data):
                LocalDataManagerImplementation.shared.saveCountryData(country: data)
                self.view.setCurrentCountry(country: data)
            }
        }
    }
}

extension MainPresenter: MainTableViewControllerDelegate {
    func setSelectedCountry(country: CountryDataModelObject) {
        view.setCurrentCountry(country: country)
    }
}
