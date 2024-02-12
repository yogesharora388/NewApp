//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Combine
import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [Article] = []
    
    private var originalNews: [Article] = [] {
        didSet {
            updateDisplayNews()
        }
    }
    
    private let newsReaderService: Reader
    
    @Published var searchText: String = "" {
        didSet {
            updateDisplayNews()
        }
    }
    
    init(newsReaderService: Reader) {
        self.newsReaderService = newsReaderService
    }
    
    func getNews() {
        newsReaderService.getNews { [weak self] articles  in
            if let articles = articles {
                self?.originalNews = articles.sorted(by: { $0.getDisplayDate().compare($1.getDisplayDate()) == .orderedDescending })
            }
        }
    }
    
    private func updateDisplayNews() {
        let searchValue = searchText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
        if searchValue.isEmpty {
            news = originalNews
        } else {
            news = originalNews.filter{
                $0.title.lowercased().contains(searchValue)
            }.sorted(by: {
                $0.title.lowercased().numberOfOccurrencesOf(string: searchValue) > $1.title.lowercased().numberOfOccurrencesOf(string: searchValue)
            })
        }
    }
}
