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
    private var apiClient: APIClientProtocol? = APIClient()

    init() {
        self.apiClient?.delegate = self
    }
    
    func getQuestions(with queries: [URLQueryItem]?) {
        apiClient?.setQueryItems(with: queries)
        #if DEBUG
            apiClient?.loadJsonData(file: "questions")
        #else
            apiClient?.fetchQuestions()
        #endif
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
