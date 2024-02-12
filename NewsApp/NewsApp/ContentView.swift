//
//  ContentView.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = NewsViewModel(newsReaderService: NewsReader())
    
    
    
    var body: some View {
        listContentView
            .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.getNews()
        }
    }
    
    private var listContentView: some View {
        if viewModel.news.isEmpty {
            return AnyView(VStack {
                Text("No Content")
            })
        } else {
            return AnyView(List($viewModel.news, id: \.self) { item in
                VStack(alignment: .leading) {
                    if let urlToImage = item.wrappedValue.urlToImage {
                        AsyncImage(url: URL(string: urlToImage)) { image in
                          image.resizable()
                            .aspectRatio(contentMode: .fit) // or .fill
                        } placeholder: {
                          ProgressView()
                        }
                    }
                    
                    Text(verbatim: item.wrappedValue.title)
                    Text(verbatim: item.wrappedValue.getDisplayDate())
                        .foregroundColor(Color.gray)
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
