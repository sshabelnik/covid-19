//
//  MainViewOutput.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewOutput: AnyObject {
    func getData()
    func setSelectedCountry(country: CountryDataModelObject)
    func prepareSegue(for segue: UIStoryboardSegue)
    func getAndSaveWorldData()
    func getAndSaveCountryData()
}
