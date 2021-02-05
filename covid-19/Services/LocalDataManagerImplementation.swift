//
//  LocalDataManagerImplementation.swift
//  covid-19
//
//  Created by Сергей Шабельник on 28.01.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//class LocalDataManagerImplementation {
//    
//    public static let shared = LocalDataManagerImplementation()
//
//    func saveCountryData(country: CountryDataModelObject) {
//        clearEntity(entityName: "CountryData")
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let userEntity = NSEntityDescription.entity(forEntityName: "CountryData", in: managedContext)!
//        
//        
//        let currentCountry = NSManagedObject(entity: userEntity, insertInto: managedContext)
//        currentCountry.setValue(country.totalConfirmedCases, forKey: "totalConfirmedCases")
//        currentCountry.setValue(country.newlyConfirmedCases, forKey: "newlyConfirmedCases")
//        currentCountry.setValue(country.totalDeaths, forKey: "totalDeaths")
//        currentCountry.setValue(country.newDeaths, forKey: "newDeaths")
//        currentCountry.setValue(country.totalRecoveredCases, forKey: "totalRecoveredCases")
//        currentCountry.setValue(country.newlyRecoveredCases, forKey: "newlyRecoveredCases")
//        
//        do {
//            try managedContext.save()
//        }   catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//        
//    }
//    
//    func saveWorldData(data: WorldDataModelObject) {
//        clearEntity(entityName: "WorldData")
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let userEntity = NSEntityDescription.entity(forEntityName: "WorldData", in: managedContext)!
//        
//        let worldData = NSManagedObject(entity: userEntity, insertInto: managedContext)
//        
//        worldData.setValue(data.totalConfirmedCases, forKey: "totalConfirmedCases")
//        worldData.setValue(data.newlyConfirmedCases, forKey: "newlyConfirmedCases")
//        worldData.setValue(data.totalDeaths, forKey: "totalDeaths")
//        worldData.setValue(data.newDeaths, forKey: "newDeaths")
//        worldData.setValue(data.totalRecoveredCases, forKey: "totalRecoveredCases")
//        worldData.setValue(data.newlyRecoveredCases, forKey: "newlyRecoveredCases")
//        
//        do {
//            try managedContext.save()
//        }   catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
//    
//    func getCountryData(completionHandler: @escaping (Result<CountryDataModelObject, Error>) -> ()) {
//        
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        
//        let managedContext = appDelegate!.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryData")
//        
//        
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            if result.first == nil {
//                completionHandler(.success(CountryDataModelObject(country: "Kazakhstan", code: "KZ", confirmed: 182530, recovered: 164319, critical: 15735, deaths: 2476)))
//            }
//            else {
//                let data = result.first as! NSManagedObject
//                let country = data.value(forKey: "country") as! String
//                let code = data.value(forKey: "code") as! String
//                let confirmed = data.value(forKey: "confirmed") as! Int
//                let critical = data.value(forKey: "critical") as! Int
//                let deaths = data.value(forKey: "deaths") as! Int
//                let recovered = data.value(forKey: "recovered") as! Int
//                let currentCountry = CountryDataModelObject(country: country, code: code, confirmed: confirmed, recovered: recovered, critical: critical, deaths: deaths)
//                completionHandler(.success(currentCountry))
//            }
//            
//        } catch let error {
//            print("Failed")
//            completionHandler(.failure(error))
//        }
//    
//    }
//    
//    func getWorldData(completionHandler: @escaping (Result<WorldDataModelObject, Error>) -> ()) {
//        
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        
//        let managedContext = appDelegate!.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WorldData")
//        
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            let data = result.first as! NSManagedObject
//            let confirmed = data.value(forKey: "confirmed") as! Int
//            let critical = data.value(forKey: "critical") as! Int
//            let deaths = data.value(forKey: "deaths") as! Int
//            let recovered = data.value(forKey: "recovered") as! Int
//            
//            completionHandler(.success(currentCountry))
//            
//            
//        } catch let error {
//            print("Failed")
//            completionHandler(.failure(error))
//        }
//    }
//    
//    func clearEntity(entityName: String) {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        
//        let managedContext = appDelegate!.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//        
//        fetchRequest.includesPropertyValues = false
//
//        do {
//            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
//
//            for item in items {
//                managedContext.delete(item)
//            }
//            try managedContext.save()
//
//        } catch {
//            
//        }
//    }
//    
//}
