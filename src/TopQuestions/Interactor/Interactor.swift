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
    
    func getQuestions(with queries: [URLQueryItem]?) {
        apiClient.delegate = self
        apiClient.setQueryItems(with: queries)
        apiClient.fetchQuestions()
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
