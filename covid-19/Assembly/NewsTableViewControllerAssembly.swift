//
//  NewsTableViewControllerAssembly.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewControllerAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? NewsTableViewController else { return }
        
        let presenter = NewsPresenter()
        let networkManager = NetworkManagerImplementation()
        
        view.presenter = presenter
        
        presenter.networkManager = networkManager
        presenter.view = view
    }
}
