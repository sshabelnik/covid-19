//
//  SelectingViewInput.swift
//  covid-19
//
//  Created by Сергей Шабельник on 09.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

protocol SelectingViewInput: AnyObject {
    func setCurrentCountry(country: CountryDataModelObject)
    func setAllCountries(countries: [CountryModelObject])
}
