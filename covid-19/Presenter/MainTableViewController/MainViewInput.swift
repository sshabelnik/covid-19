//
//  MainViewInput.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewInput: AnyObject {
    func setCurrentCountry(country: CountryDataModelObject)
    func setWorldData(data: WorldDataModelObject)
}
