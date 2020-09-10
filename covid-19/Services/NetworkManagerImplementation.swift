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
            
            
            guard let result = response.value else { return }
            
            let countrysArray = result.map({$0.createObject()})
            print(countrysArray[0].name!)
            DispatchQueue.main.async {
                completion(.success(countrysArray))
            }
        }
    }
}
