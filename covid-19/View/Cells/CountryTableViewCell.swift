//
//  CountryTableViewCell.swift
//  covid-19
//
//  Created by Сергей Шабельник on 21.07.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var todayCovidLabel: UILabel!
    @IBOutlet weak var todayCountLabel: UILabel!
    @IBOutlet weak var allCovidLabel: UILabel!
    @IBOutlet weak var allTimeCountLabel: UILabel!
    
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
        todayCountLabel.text = String(country.confirmed)
        allTimeCountLabel.text = String(country.recovered)
    }
    
}
