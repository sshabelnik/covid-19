//
//  NewsTableViewController.swift
//  covid-19
//
//  Created by Сергей Шабельник on 07.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController {
    
    var news: [News]! = []

    @IBOutlet weak var tableView: UITableView!
    
    let networkManager = NetworkManagerImplementation()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        fetchNews()
    }
    
    func fetchNews() {
        networkManager.getNews { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let data):
                DispatchQueue.main.async {
                    self.news = data.news
                    self.tableView.reloadData()
                }
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

extension NewsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(countryNib, forCellReuseIdentifier: "NewsTableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        cell.setup(for: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
