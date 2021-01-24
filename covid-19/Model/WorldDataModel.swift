//
//  WorldDataModel.swift
//  covid-19
//
//  Created by Сергей Шабельник on 11.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct WorldDataModel: Codable{
    
    let confirmed: Int
    let recovered: Int
    let critical: Int
    let deaths: Int
    
    func createObject() -> WorldDataModelObject{
        return WorldDataModelObject(confirmed: confirmed, recovered: recovered, critical: critical, deaths: deaths)
    }
}
