//
//  Article.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Foundation

struct Article: Decodable, Hashable {
    let title: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
}
