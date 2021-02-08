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

    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(for new: News){
        self.titleTextLabel.text = new.title
        self.descriptionTextLabel.text = new.excerpt
        guard let imageString = new.images?.first?.url else { return }
        let imageURL = URL(string: imageString)
        self.newImageView.sd_setImage(with: imageURL, completed: nil)
        self.newImageView.layer.cornerRadius = 25
    }
}
