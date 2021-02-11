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
        DispatchQueue.main.async {
            cell.setup(for: news[indexPath.row])
        }
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = news?[indexPath.row].webUrl else { return }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - ViewInput
extension NewsTableViewController: NewsViewInput {
    func importNews(news: [News]) {
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
        }
    }
}
