//
//  NewsModel.swift
//  covid-19
//
//  Created by Сергей Шабельник on 07.02.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    let location: Location
    let updatedDateTime: String
    let news: [News]
}

struct Location: Codable {
    let countryOrRegion: String
    let isoCode: String
}

struct News: Codable {
    let title, excerpt: String
    let webUrl : String
    let tags: [String]
    let images: [Image]?
    let ampWebUrl, cdnAmpWebUrl: String?
    let publishedDateTime: String
}

struct Image: Codable {
    let url: String
}
