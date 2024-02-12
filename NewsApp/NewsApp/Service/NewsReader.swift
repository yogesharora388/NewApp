//
//  NewsReader.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Foundation

protocol Reader {
    func getNews(_ completion: @escaping ([Article]?) -> Void)
}

class NewsReader: Reader {
    func getNews(_ completion: @escaping ([Article]?) -> Void) {
        guard let newsData = JsonReader().getJsonData(from: "news") else {
            completion([])
            return
        }
        
        do {
            let result = try JSONDecoder().decode(Articles.self, from: newsData)
            completion(result.articles)
        } catch {
            print("error:\(error)")
            completion([])
        }
    }
}
