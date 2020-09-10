//
//  SelectingViewController.swift
//  covid-19
//
//  Created by Сергей Шабельник on 10.09.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class SelectingViewController: UIViewController {

    var countrys: [CountryModelObject]! = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var networkManager: NetworkManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        networkManager = NetworkManagerImplementation()
        DispatchQueue.main.async {
            self.getCountrys()
        }
        
    }
    
    func getCountrys(){
        networkManager.getListOfCountries { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let array):
                self.countrys = array
                self.tableView.reloadData()    
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = countrys[indexPath.row].name
        return cell
    }
    
    
    
}
