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

class LocalDataManagerImplementation: NSObject {
    
    public static let shared = LocalDataManagerImplementation()

    func createData(country: CountryDataModelObject) {
        clearEntity()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "CountryData", in: managedContext)!
        
        
        let currentCountry = NSManagedObject(entity: userEntity, insertInto: managedContext)
        currentCountry.setValue(country.code, forKey: "code")
        currentCountry.setValue(country.confirmed, forKey: "confirmed")
        currentCountry.setValue(country.country, forKey: "country")
        currentCountry.setValue(country.critical, forKey: "critical")
        currentCountry.setValue(country.deaths, forKey: "deaths")
        currentCountry.setValue(country.recovered, forKey: "recovered")
        
        do {
            try managedContext.save()
        }   catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func getData(completionHandler: @escaping (Result<CountryDataModelObject, Error>) -> ()) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryData")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            if result.first == nil {
                completionHandler(.success(CountryDataModelObject(country: "Kazakhstan", code: "KZ", confirmed: 182530, recovered: 164319, critical: 15735, deaths: 2476)))
            }
            else {
                let data = result.first as! NSManagedObject
                let country = data.value(forKey: "country") as! String
                let code = data.value(forKey: "code") as! String
                let confirmed = data.value(forKey: "confirmed") as! Int
                let critical = data.value(forKey: "critical") as! Int
                let deaths = data.value(forKey: "deaths") as! Int
                let recovered = data.value(forKey: "recovered") as! Int
                let currentCountry = CountryDataModelObject(country: country, code: code, confirmed: confirmed, recovered: recovered, critical: critical, deaths: deaths)
                completionHandler(.success(currentCountry))
            }
            
        } catch let error {
            print("Failed")
            completionHandler(.failure(error))
        }
    }
    
    func setDefaultsValue() {
        
    }
    
    func clearEntity() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate!.persistentContainer.viewContext
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryData")

        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false

        do {
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]

            for item in items {
                managedContext.delete(item)
            }

            // Save Changes
            try managedContext.save()

        } catch {
            // Error Handling
            // ...
        }
    }
    
}
