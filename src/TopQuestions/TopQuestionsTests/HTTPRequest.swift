//
//  HTTPRequest.swift
//  TopQuestionsTests
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import XCTest
@testable import TopQuestions

class HTTPRequest: XCTestCase, APIResponseProtocol {

    func testExample() throws {
        let params: [String: String] = [
            "site": "stackoverflow",
            "order": "desc",
            "sort": "votes",
            "tagged": "swiftui",
            "pagesize": "10"
        ]
        let queries: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        let apiClient = APIClient()
        apiClient.delegate = self
        apiClient.setQueryItems(with: queries)
        apiClient.fetchQuestions()
    }
    
    func fetched(response: Response) {
        print(response)
    }
    
    func error() {
 
    }
}
