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
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "84d4f068eamshae63f22a1e6b83ap1c09a2jsn11cffe38c5ef"
        ]
        
        let url = URL(string: "https://covid-19-data.p.rapidapi.com/help/countries?format=json")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    static func countryDataURL(countryCode: String) -> URLRequest{
        
        let headers = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "84d4f068eamshae63f22a1e6b83ap1c09a2jsn11cffe38c5ef"
        ]
        
        let url = URL(string: "https://covid-19-data.p.rapidapi.com/country/code?format=json&code=\(countryCode)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    static func worldDataURL() -> URLRequest{
           
           let headers = [
               "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
               "x-rapidapi-key": "84d4f068eamshae63f22a1e6b83ap1c09a2jsn11cffe38c5ef"
           ]
           
           let url = URL(string: "https://covid-19-data.p.rapidapi.com/totals?format=json")
           
           var request = URLRequest(url: url!)
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headers
           
           return request
       }
}
