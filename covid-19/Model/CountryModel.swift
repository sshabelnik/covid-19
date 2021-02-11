//
//  CountryModel.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct CountryModel: Codable{
    
    let name: String
    let alpha2code: String?
    
    func createObject() -> CountryModelObject{
        return CountryModelObject(name: name, alpha2code: alpha2code ?? "kz")
    }
    
}
