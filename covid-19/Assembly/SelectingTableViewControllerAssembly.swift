//
//  SelectingTableViewControllerAssembly.swift
//  covid-19
//
//  Created by Сергей Шабельник on 09.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation
import UIKit

class SelectingTableViewControllerAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? SelectingViewController else { return }
        
        let presenter = SelectingPresenter()
        let networkManager = NetworkManagerImplementation()
        
        view.presenter = presenter
        
        presenter.networkManager = networkManager
        presenter.view = view
    }
}
