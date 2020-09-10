//
//  MainTableViewController.swift
//  covid-19
//
//  Created by Сергей Шабельник on 21.07.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let networkManager = NetworkManagerImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "selectingSegue", sender: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}

extension MainTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
