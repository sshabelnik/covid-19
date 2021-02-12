//
//  SelectingPresenter.swift
//  covid-19
//
//  Created by Сергей Шабельник on 09.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

class SelectingPresenter: SelectingViewOutput {
    
    weak var view: SelectingViewInput!
    var networkManager: NetworkManager!
    
    func getCountrys(){
        networkManager.getListOfCountries { (result) in
            switch result{
            case .failure(let error):
                print("ALLCOUNTRIES ERROR: \(error)")
            case .success(let array):
                self.view.setAllCountries(countries: array)
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
    
    func rowSelected(country: CountryModelObject) {
        networkManager.getDataCountry(country: country.alpha2code!) { (response) in
            switch response{
            case .failure(let error):
                print("DATACOUNTRY ERROR \(error)")
            case .success(let currentCountry):
                DispatchQueue.main.async {
                    self.view.setCurrentCountry(country: currentCountry)
                    LocalDataManager.shared.saveCountryData(country: currentCountry)
                }
            }
        }
    }
}
