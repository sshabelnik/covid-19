//
//  CountryTableViewCell.swift
//  covid-19
//
//  Created by Сергей Шабельник on 21.07.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newConfirmedCovidLabel: UILabel!
    @IBOutlet weak var confirmedCovidLabel: UILabel!
    @IBOutlet weak var recoveredCovidLabel: UILabel!
    @IBOutlet weak var sickCovidLabel: UILabel!
    @IBOutlet weak var deathsCovidLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.mainView.layer.shadowColor = UIColor.black.cgColor
//        self.mainView.layer.shadowOpacity = 0.5
//        self.mainView.layer.shadowOffset = .zero
//        self.mainView.layer.shadowRadius = 3.0
//        
//        self.mainView.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(for country: CountryDataModelObject){
        self.newConfirmedCovidLabel.text = "+ " + String(country.newlyConfirmedCases.formattedWithSeparator)
        self.confirmedCovidLabel.text = String(country.totalConfirmedCases.formattedWithSeparator)
        self.recoveredCovidLabel.text = String(country.totalRecoveredCases.formattedWithSeparator)
        self.sickCovidLabel.text = String(country.totalSickCases.formattedWithSeparator)
        self.deathsCovidLabel.text = String(country.totalDeaths.formattedWithSeparator)
    }
    
}
