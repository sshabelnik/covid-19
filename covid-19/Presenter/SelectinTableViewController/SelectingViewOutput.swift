//
//  SelectingViewOutput.swift
//  covid-19
//
//  Created by Сергей Шабельник on 09.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

protocol SelectingViewOutput: AnyObject {
    func getCountrys()
    func flag(country:String) -> String
    func rowSelected(country: CountryModelObject) 
}
