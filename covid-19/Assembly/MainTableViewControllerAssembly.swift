//
//  MainTableViewControllerAssembly.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewControllerAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? MainTableViewController else { return }
        
        let presenter = MainPresenter()
        let networkManager = NetworkManagerImplementation()
        
        view.presenter = presenter
        
        presenter.networkManager = networkManager
        presenter.view = view
        
    }
}
