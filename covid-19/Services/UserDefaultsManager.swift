//
//  UserDefaultsManager.swift
//  covid-19
//
//  Created by Сергей Шабельник on 12.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private let key = "hasAlreadyLaunched"
    private var value: Bool!
    
    func isFirstLaunch() -> Bool! {
        value = UserDefaults.standard.bool(forKey: key)
        return value
    }
    
    func hasAlreadyLaunched() {
        UserDefaults.standard.setValue(true, forKey: key)
    }
}
