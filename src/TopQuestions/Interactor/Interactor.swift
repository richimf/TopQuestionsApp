//
//  Interactor.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

final class Interactor: InteractorInputProtocol {

    // MARK: - VIPER
    /// weak avoids retain cycles
    weak var presenter: InteractorOutputProtocol?
    private let apiClient = APIClient()
    
    init() {
        apiClient.delegate = self
    }
    
    func getQuestions(with queries: [URLQueryItem]?) {
        apiClient.setQueryItems(with: queries)
        apiClient.fetchQuestions()
    }
    
    func getQuestionsDetailsFor(questionId: String, with queries: [URLQueryItem]?) {
        apiClient.setQueryItems(with: queries)
        apiClient.fetchQuestionDetailsFor(questionId: questionId)
    }
}
extension Interactor: APIResponseProtocol {
    func fetched(response: Response) {
        presenter?.updateData(with: response)
    }

    func error() {
        presenter?.showError()
    }
}
