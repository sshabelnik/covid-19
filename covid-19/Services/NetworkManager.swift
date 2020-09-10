//
//  NetworkManager.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

protocol NetworkManager: AnyObject{
    func getListOfCountries(completion: @escaping (Result<[CountryModelObject], Error>) -> Void)
}
