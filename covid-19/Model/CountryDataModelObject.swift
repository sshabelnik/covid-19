//
//  CountryDataModelObject.swift
//  covid-19
//
//  Created by Сергей Шабельник on 11.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct CountryDataModelObject{
    
    let country: String
    let code: String
    let totalConfirmedCases: Int
    let newlyConfirmedCases: Int
    let totalDeaths: Int
    let newDeaths: Int
    let totalRecoveredCases: Int
    let newlyRecoveredCases: Int
    let totalSickCases: Int
}
