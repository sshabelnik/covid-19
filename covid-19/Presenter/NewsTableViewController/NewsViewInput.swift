//
//  NewsViewInput.swift
//  covid-19
//
//  Created by Сергей Шабельник on 08.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

protocol NewsViewInput: AnyObject {
    func importNews(news: [News])
}
