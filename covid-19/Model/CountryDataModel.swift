//
//  CountryDataModel.swift
//  covid-19
//
//  Created by Сергей Шабельник on 11.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct CountryDataModel: Codable{
    
    let country: String
    let code: String
    let confirmed: Int
    let recovered: Int
    let critical: Int
    let deaths: Int
    
    func createObject() -> CountryDataModelObject{
        return CountryDataModelObject(country: country, code: code, confirmed: confirmed, recovered: recovered, critical: critical, deaths: deaths)
    }
}
