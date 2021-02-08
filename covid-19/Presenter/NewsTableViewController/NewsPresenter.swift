//
//  NewsPresenter.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

class NewsPresenter: NewsViewOutput {
 
    var networkManager: NetworkManager!
    weak var view: NewsViewInput!
    
    func fetchNews() {
        networkManager.getNews { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let data):
                DispatchQueue.main.async {
                    self.view.importNews(news: data.news)
                }
            }
        }
    }
}
