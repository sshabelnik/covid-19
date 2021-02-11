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
    @IBOutlet weak var dateLabel: UILabel!
    
    func setupCell(for country: CountryDataModelObject){
        self.newConfirmedCovidLabel.text = "+" + String(country.newlyConfirmedCases.formattedWithSeparator)
        self.confirmedCovidLabel.text = String(country.totalConfirmedCases.formattedWithSeparator)
        self.recoveredCovidLabel.text = String(country.totalRecoveredCases.formattedWithSeparator)
        self.sickCovidLabel.text = String(country.totalSickCases.formattedWithSeparator)
        self.deathsCovidLabel.text = String(country.totalDeaths.formattedWithSeparator)
        self.dateLabel.text = "new cases for " + formatDate(date: country.updatedDateTime)
        drawLine(for: country)
    }
    
    func formatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dateFromString = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = dateFormatter.string(from: dateFromString!)
        return formattedDate
    }
    
    func drawLine(for country: CountryDataModelObject){
        let lineView = LineView(frame: CGRect(x: 15, y: 150, width: mainView.bounds.size.width - 30, height: 20))

        lineView.colors = [UIColor(named: "green"), UIColor(named: "orange"), UIColor(named: "red")]
        let deathsPercent = CGFloat(Double(country.totalDeaths) / Double(country.totalConfirmedCases))
        let sickPercent = CGFloat(Double(country.totalSickCases) / Double(country.totalConfirmedCases))
        let recoveredPercent = CGFloat(Double(country.totalRecoveredCases) / Double(country.totalConfirmedCases))
        lineView.values = [recoveredPercent, sickPercent, deathsPercent]

        mainView.addSubview(lineView);
    }
}
