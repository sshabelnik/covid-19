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
    
    func createObject() -> WorldDataModelObject{
        return WorldDataModelObject(totalConfirmedCases: stats.totalConfirmedCases,
                                    newlyConfirmedCases: stats.newlyConfirmedCases,
                                    totalDeaths: stats.totalDeaths,
                                    newDeaths: stats.newDeaths,
                                    totalRecoveredCases: stats.totalRecoveredCases,
                                    newlyRecoveredCases: stats.newlyRecoveredCases,
                                    totalSickCases: stats.totalConfirmedCases - stats.totalDeaths - stats.totalRecoveredCases)
    }
}

struct WorldDataModel: Codable{
    
    let totalConfirmedCases: Int
    let newlyConfirmedCases: Int
    let totalDeaths: Int
    let newDeaths: Int
    let totalRecoveredCases: Int
    let newlyRecoveredCases: Int
}
