//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Yogesh Arora on 09/02/24.
//

import XCTest
import Combine
@testable import NewsApp

final class NewsAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testNewsViewModelIsEmpty() {
        let viewModel = NewsViewModel(newsReaderService: MockNewsReader())
        
        XCTAssertTrue(
            viewModel.news.isEmpty,
            "Expected initial value to be empty, but got \(viewModel.news)."
        )
    }
    
    func testNewsViewModelHavingData() throws {
        let viewModel = NewsViewModel(newsReaderService: MockNewsReader())
        viewModel.getNews()
        XCTAssertEqual(viewModel.news.count, 2, "Found News")
    }
    
    func testNewsWithSink() {
        //Given
        let viewModel = NewsViewModel(newsReaderService: MockNewsReader())
        let expectation = XCTestExpectation(description: "Have 1 item")
        viewModel.getNews()
        
        var cancellable: AnyCancellable?
        cancellable = viewModel.$news
            .sink(receiveValue: {
                // Assert there are 2 new value
                XCTAssertEqual($0.count, 2)
                cancellable?.cancel()
                // Fulfill the expectation
                expectation.fulfill()
            })
        
        //Then
        wait(for: [expectation], timeout: 1)
    }
    
    func testSortByDate() {
        let viewModel = NewsViewModel(newsReaderService: MockNewsReader())
        viewModel.getNews()
        XCTAssertEqual(viewModel.news.count, 2, "Found News")
        XCTAssertEqual(viewModel.news.first?.title, "News2", "Match Fount")
    }
}
