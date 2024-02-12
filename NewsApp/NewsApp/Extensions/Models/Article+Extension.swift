//
//  Article+Extension.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Foundation

extension Article {
    func getDisplayDate() -> String {
        if publishedAt.isEmpty {
            return ""
        }
        
        let inputFormat = DateFormatter()
        inputFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let dateString = inputFormat.date(from: publishedAt) else {
            return publishedAt
        }
        
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return outputFormat.string(from: dateString)
    }
}

// Mock data
extension Article {
    public static func make(with name: String, and publishedAt: String) -> Self {
        return .init(title: name, url: "Test URL", urlToImage: "Test URL Image", publishedAt: publishedAt)
    }
}
