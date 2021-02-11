//
//  CountryModelObject.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct CountryModelObject{
 
    let name: String!
    let alpha2code: String?
    
    init(name: String, alpha2code: String){
        self.name = name
        self.alpha2code = alpha2code
    }
}
