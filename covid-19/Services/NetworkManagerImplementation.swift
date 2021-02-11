//
//  NetworkManagerImplementation.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManagerImplementation: NetworkManager{
    
    func getListOfCountries(completion: @escaping (Result<[CountryModelObject], Error>) -> Void) {
        
        AF.request(Endpoints.allCountriesURL()).responseDecodable(of: [CountryModel].self) { (response) in
            if let error = response.error{
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let value = response.value else { return }
            
            let countrysArray = value.map({$0.createObject()})
            DispatchQueue.main.async {
                completion(.success(countrysArray))
            }
        }
    }
    
    func getDataCountry(country: String, completion: @escaping ((Result<CountryDataModelObject, Error>) -> Void)) {
        AF.request(Endpoints.countryDataURL(countryCode: country)).responseDecodable(of: CountryDataStats.self){ (response) in
            if let error = response.error{
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            guard let value = response.value else {return}
            
            let countryData = value.createObject()
            
            DispatchQueue.main.async {
                completion(.success(countryData))
            }
        }
    }
    
    func getWorldData(completion: @escaping (Result<WorldDataModelObject, Error>) -> Void){
        
        AF.request(Endpoints.worldDataURL()).responseDecodable(of: WorldDataStats.self) { (response) in
            if let error = response.error{
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            guard let value = response.value else {return}
            
            let worldData = value.createObject()
            
            DispatchQueue.main.async {
                completion(.success(worldData))
            }
        }
    }
    
    func getNews(completion: @escaping (Result<NewsModel, Error>) -> Void) {
        
        AF.request(Endpoints.newsURL()).responseDecodable(of: NewsModel.self) { (response) in
            if let error = response.error{
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            guard let value = response.value else {return}
            DispatchQueue.main.async {
                completion(.success(value))
            }
        }
    }
}
