//
//  CountryTableViewCell.swift
//  covid-19
//
//  Created by Сергей Шабельник on 21.07.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainView: UIView!
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
        self.newConfirmedCovidLabel.text = "+" + String(country.newlyConfirmedCases.formattedWithSeparator)
        self.confirmedCovidLabel.text = String(country.totalConfirmedCases.formattedWithSeparator)
        self.recoveredCovidLabel.text = String(country.totalRecoveredCases.formattedWithSeparator)
        self.sickCovidLabel.text = String(country.totalSickCases.formattedWithSeparator)
        self.deathsCovidLabel.text = String(country.totalDeaths.formattedWithSeparator)
        drawLine(for: country)
    }
    
    func drawLine(for country: CountryDataModelObject){
        let lineView = LineView(frame: CGRect(x: 15, y: 180, width: mainView.bounds.size.width - 30, height: 20))

        lineView.colors = [
            UIColor.green, // green
            UIColor.orange, // orange
            UIColor.red // red
        ]
        let deathsPercent = CGFloat(Double(country.totalDeaths) / Double(country.totalConfirmedCases))
        let sickPercent = CGFloat(Double(country.totalSickCases) / Double(country.totalConfirmedCases))
        let recoveredPercent = CGFloat(Double(country.totalRecoveredCases) / Double(country.totalConfirmedCases))
        lineView.values = [recoveredPercent, sickPercent, deathsPercent]

        mainView.addSubview(lineView);
    }
    
}
