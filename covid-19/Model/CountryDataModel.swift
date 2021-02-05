//
//  CountryDataModel.swift
//  covid-19
//
//  Created by Сергей Шабельник on 11.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct CountryDataName: Codable {
    let countryOrRegion: String
    let isoCode: String
}

struct CountryDataModel: Codable{
    
    let totalConfirmedCases: Int
    let newlyConfirmedCases: Int
    let totalDeaths: Int
    let newDeaths: Int
    let totalRecoveredCases: Int
    let newlyRecoveredCases: Int
}

struct CountryDataStats: Codable {
    let location: CountryDataName
    let updatedDateTime: String
    let stats: CountryDataModel
    
    func createObject() -> CountryDataModelObject{
        
        return CountryDataModelObject(country: location.countryOrRegion, code: location.isoCode, totalConfirmedCases: stats.totalConfirmedCases, newlyConfirmedCases: stats.newlyConfirmedCases, totalDeaths: stats.totalDeaths, newDeaths: stats.newDeaths, totalRecoveredCases: stats.totalRecoveredCases, newlyRecoveredCases: stats.newlyRecoveredCases, totalSickCases: stats.totalConfirmedCases - stats.totalDeaths - stats.totalRecoveredCases)
    }
}


