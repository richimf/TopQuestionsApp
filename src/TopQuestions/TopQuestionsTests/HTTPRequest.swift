//
//  HTTPRequest.swift
//  TopQuestionsTests
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import XCTest
@testable import TopQuestions

final class HTTPRequest: XCTestCase, APIResponseProtocol {

    private let expectation = XCTestExpectation(description: "response")

    func testQuestionList() throws {
        let params: [String: String] = [
            "site": "stackoverflow",
            "order": "desc",
            "sort": "votes",
            "tagged": "swiftui",
            "pagesize": "10"
        ]
        let queries: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        
        let apiClient = MockAPIClient()
        apiClient.delegate = self
        apiClient.setQueryItems(with: queries)
        apiClient.fetchQuestions()
    }

    func fetched(response: Response) {
        XCTAssert(response.items.count == 10)
        expectation.fulfill()
    }

    func error() {
 
    }
}
