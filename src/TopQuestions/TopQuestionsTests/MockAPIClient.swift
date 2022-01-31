//
//  MockAPIClient.swift
//  TopQuestionsTests
//
//  Created by Ricardo Montesinos on 31/1/22.
//

import Foundation
@testable import TopQuestions

final class MockAPIClient: APIClientProtocol {

    var delegate: APIResponseProtocol?
    private var components = URLComponents()

    func setQueryItems(with queries: [URLQueryItem]?) {
        components.path = APIURL.path.rawValue
        components.queryItems = queries
    }

    func loadJsonData(file: String) {
        if let jsonFilePath = Bundle(for: type(of:  self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            if let data = try? Data(contentsOf: jsonFileURL) {
                if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
                    self.delegate?.fetched(response: decodedData)
                }
            }
        }
    }

    func fetchQuestions() {
        loadJsonData(file: "questions")
    }

    func fetchQuestionDetailsFor(questionId: Int) {
    }
}
