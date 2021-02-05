//
//  WorldDataModel.swift
//  covid-19
//
//  Created by Сергей Шабельник on 11.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct WorldDataStats: Codable {
    let updatedDateTime: String
    let stats: WorldDataModel
}

struct WorldDataModel: Codable{
    
    let totalConfirmedCases: Int
    let newlyConfirmedCases: Int
    let totalDeaths: Int
    let newDeaths: Int
    let totalRecoveredCases: Int
    let newlyRecoveredCases: Int
    
    func createObject() -> WorldDataModelObject{
        return WorldDataModelObject(totalConfirmedCases: totalConfirmedCases, newlyConfirmedCases: newlyConfirmedCases, totalDeaths: totalDeaths, newDeaths: newDeaths, totalRecoveredCases: totalRecoveredCases, newlyRecoveredCases: newlyRecoveredCases, totalSickCases: totalConfirmedCases - totalDeaths - totalRecoveredCases)
    }
}
