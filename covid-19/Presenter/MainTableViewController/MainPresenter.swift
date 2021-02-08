//
//  MainPresenter.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainViewOutput, MainTableViewControllerDelegate {
    
    var networkManager: NetworkManager!
    weak var view: MainViewInput!
    
    func getData() {
        LocalDataManagerImplementation.shared.getCountryData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.view.setCurrentCountry(country: data)
            }
        }
//
//        LocalDataManagerImplementation.shared.getWorldData { (result) in
//            switch result {
//            case.failure(let error):
//                print(error)
//                self.networkManager.getWorldData { (result) in
//                    switch result{
//                    case.failure(let error):
//                        print("Getting WorldData error: \(error)")
//                    case.success(let data):
//                        self.worldData = data
//                        LocalDataManagerImplementation.shared.saveWorldData(data: data)
//                    }
//                }
//            case .success(let data):
//                self.worldData = data
//            }
//        }
    }
    
    func setSelectedCountry(country: CountryDataModelObject) {
        view.setCurrentCountry(country: country)
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
}
