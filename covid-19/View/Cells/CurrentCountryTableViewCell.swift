//
//  CurrentCountryTableViewCell.swift
//  covid-19
//
//  Created by Сергей Шабельник on 11.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class CurrentCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var currentCountryLabel: UILabel!
    @IBOutlet weak var currentCountryFlagLabel: UILabel!
    
    func setCurrentCountry(country: CountryDataModelObject){
        self.currentCountryLabel.text = country.country
        self.currentCountryFlagLabel.text = flag(country: country.code)
    }
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
