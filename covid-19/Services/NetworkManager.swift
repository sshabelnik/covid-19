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
    func getDataCountry(country: String, completion: @escaping (Result<CountryDataModelObject, Error>) -> Void)
    func getWorldData(completion: @escaping (Result<WorldDataModelObject, Error>) -> Void)
    func getNews(completion: @escaping (Result<NewsModel, Error>) -> Void)
}
