//
//  Endpoints.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

class Endpoints{
    
    static func allCountriesURL() -> URLRequest{
        
        let headers = [
            "x-rapidapi-host": Constants.COVID_HOST,
            "x-rapidapi-key": Constants.API_KEY
        ]
        
        let url = URL(string: "https://covid-19-data.p.rapidapi.com/help/countries?format=json")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    static func countryDataURL(countryCode: String) -> URLRequest{
        
        let headers = [
            "x-rapidapi-key": Constants.API_KEY,
            "x-rapidapi-host": Constants.SMARTABLE_HOST
        ]
        
        let url = URL(string: "https://coronavirus-smartable.p.rapidapi.com/stats/v1/\(countryCode)/")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    static func worldDataURL() -> URLRequest{
           
        let headers = [
            "x-rapidapi-key": Constants.API_KEY,
            "x-rapidapi-host": Constants.SMARTABLE_HOST
        ]
           
           let url = URL(string: "https://coronavirus-smartable.p.rapidapi.com/stats/v1/global/")
           
           var request = URLRequest(url: url!)
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headers
           
           return request
       }
    
    static func newsURL() -> URLRequest{
        let headers = [
            "x-rapidapi-key": Constants.API_KEY,
            "x-rapidapi-host": Constants.SMARTABLE_HOST
        ]
        
        let url = URL(string: "https://coronavirus-smartable.p.rapidapi.com/news/v1/RU/")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
