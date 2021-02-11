//
//  NewsTableViewCell.swift
//  covid-19
//
//  Created by Сергей Шабельник on 07.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.shadowColor = UIColor.black.cgColor
        self.mainView.layer.shadowOpacity = 0.5
        self.mainView.layer.shadowOffset = .zero
        self.mainView.layer.shadowRadius = 3.0
        self.mainView.layer.cornerRadius = 20.0
        self.newImageView.layer.cornerRadius = 20.0
        self.newImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setup(for new: News){
        self.titleTextLabel.text = new.title
        self.descriptionTextLabel.text = new.excerpt
        guard let imageString = new.images?.first?.url else { return }
        let imageURL = URL(string: imageString)
        DispatchQueue.main.async {
            self.newImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
}
