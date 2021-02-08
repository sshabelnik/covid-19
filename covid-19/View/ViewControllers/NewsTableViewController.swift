//
//  NewsTableViewController.swift
//  covid-19
//
//  Created by Сергей Шабельник on 07.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController {
    
    // MARK: -
    
    var presenter: NewsViewOutput!
    var news: [News]?
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetchNews()
    }
}

// MARK: - TableView DataSource
extension NewsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else { return 0 }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(countryNib, forCellReuseIdentifier: "NewsTableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        guard let news = news else { return UITableViewCell() }
        cell.setup(for: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - ViewInput
extension NewsTableViewController: NewsViewInput {
    func importNews(news: [News]) {
        self.news = news
        self.tableView.reloadData()
    }
}
