//
//  MockNewsReader.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Foundation

class MockNewsReader: Reader {
    func getNews(_ completion: @escaping ([Article]?) -> Void) {
        completion([Article.make(with: "News1", and: "2024-01-10T22:41:25Z"),
                    Article.make(with: "News2", and: "2024-01-11T22:41:25Z")])
    }
}
