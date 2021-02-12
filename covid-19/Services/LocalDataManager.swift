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

class LocalDataManager {

    public static let shared = LocalDataManager()

    func saveCountryData(country: CountryDataModelObject) {
        clearEntity(entityName: "CountryData")

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext

        let userEntity = NSEntityDescription.entity(forEntityName: "CountryData", in: managedContext)!


        let currentCountry = NSManagedObject(entity: userEntity, insertInto: managedContext)
        currentCountry.setValue(country.country, forKey: "country")
        currentCountry.setValue(country.code, forKey: "code")
        currentCountry.setValue(country.updatedDateTime, forKey: "updatedDateTime")
        currentCountry.setValue(country.totalConfirmedCases, forKey: "totalConfirmedCases")
        currentCountry.setValue(country.newlyConfirmedCases, forKey: "newlyConfirmedCases")
        currentCountry.setValue(country.totalDeaths, forKey: "totalDeaths")
        currentCountry.setValue(country.newDeaths, forKey: "newDeaths")
        currentCountry.setValue(country.totalRecoveredCases, forKey: "totalRecoveredCases")
        currentCountry.setValue(country.newlyRecoveredCases, forKey: "newlyRecoveredCases")
        currentCountry.setValue(country.totalSickCases, forKey: "totalSickCases")

        do {
            try managedContext.save()
        }   catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }

    func saveWorldData(data: WorldDataModelObject) {
        clearEntity(entityName: "WorldData")

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext

        let userEntity = NSEntityDescription.entity(forEntityName: "WorldData", in: managedContext)!

        let worldData = NSManagedObject(entity: userEntity, insertInto: managedContext)

        worldData.setValue(data.totalConfirmedCases, forKey: "totalConfirmedCases")
        worldData.setValue(data.newlyConfirmedCases, forKey: "newlyConfirmedCases")
        worldData.setValue(data.totalDeaths, forKey: "totalDeaths")
        worldData.setValue(data.newDeaths, forKey: "newDeaths")
        worldData.setValue(data.totalRecoveredCases, forKey: "totalRecoveredCases")
        worldData.setValue(data.newlyRecoveredCases, forKey: "newlyRecoveredCases")
        worldData.setValue(data.totalSickCases, forKey: "totalSickCases")

        do {
            try managedContext.save()
        }   catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func getCountryData(completionHandler: @escaping (Result<CountryDataModelObject, Error>) -> ()) {

        let appDelegate = UIApplication.shared.delegate as? AppDelegate

        let managedContext = appDelegate!.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryData")


        do {
            let result = try managedContext.fetch(fetchRequest)
            let data = result.first as! NSManagedObject
            let country = data.value(forKey: "country") as! String
            let code = data.value(forKey: "code") as! String
            let updatedDateTime = data.value(forKey: "updatedDateTime") as! String
            let totalConfirmedCases = data.value(forKey: "totalConfirmedCases") as! Int
            let newlyConfirmedCases = data.value(forKey: "newlyConfirmedCases") as! Int
            let totalDeaths = data.value(forKey: "totalDeaths") as! Int
            let newDeaths = data.value(forKey: "newDeaths") as! Int
            let totalRecoveredCases = data.value(forKey: "totalRecoveredCases") as! Int
            let newlyRecoveredCases = data.value(forKey: "newlyRecoveredCases") as! Int
            let totalSickCases = data.value(forKey: "totalSickCases") as! Int
            let currentCountry = CountryDataModelObject(country: country, code: code, updatedDateTime: updatedDateTime, totalConfirmedCases: totalConfirmedCases, newlyConfirmedCases: newlyConfirmedCases, totalDeaths: totalDeaths, newDeaths: newDeaths, totalRecoveredCases: totalRecoveredCases, newlyRecoveredCases: newlyRecoveredCases, totalSickCases: totalSickCases)
            completionHandler(.success(currentCountry))
        } catch let error {
            print("Failed get country data: \(error)")
            completionHandler(.failure(error))
        }

    }

    func getWorldData(completionHandler: @escaping (Result<WorldDataModelObject, Error>) -> ()) {

        let appDelegate = UIApplication.shared.delegate as? AppDelegate

        let managedContext = appDelegate!.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WorldData")

        do {
            let result = try managedContext.fetch(fetchRequest)
            let data = result.first as! NSManagedObject
            let totalConfirmedCases = data.value(forKey: "totalConfirmedCases") as! Int
            let newlyConfirmedCases = data.value(forKey: "newlyConfirmedCases") as! Int
            let totalDeaths = data.value(forKey: "totalDeaths") as! Int
            let newDeaths = data.value(forKey: "newDeaths") as! Int
            let totalRecoveredCases = data.value(forKey: "totalRecoveredCases") as! Int
            let newlyRecoveredCases = data.value(forKey: "newlyRecoveredCases") as! Int
            let totalSickCases = data.value(forKey: "totalSickCases") as! Int
            let currentCountry = WorldDataModelObject(totalConfirmedCases: totalConfirmedCases, newlyConfirmedCases: newlyConfirmedCases, totalDeaths: totalDeaths, newDeaths: newDeaths, totalRecoveredCases: totalRecoveredCases, newlyRecoveredCases: newlyRecoveredCases, totalSickCases: totalSickCases)

            completionHandler(.success(currentCountry))


        } catch let error {
            print("Failed get world data: \(error)")
            completionHandler(.failure(error))
        }
    }

    func clearEntity(entityName: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate

        let managedContext = appDelegate!.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        fetchRequest.includesPropertyValues = false

        do {
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]

            for item in items {
                managedContext.delete(item)
            }
            try managedContext.save()

        } catch let error {
            print("Couldn't clear entity: \(error)")
        }
    }

}
