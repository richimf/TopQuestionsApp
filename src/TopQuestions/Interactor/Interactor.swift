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
    
    func getQuestions() {
        apiClient.delegate = self
        apiClient.fetchQuestions()
    }
}
extension Interactor: APIResponseProtocol {

    func fetched() { // TODO: Add questions as parameter
        //presenter?.update(data)
    }

    func error() {
        presenter?.showError()
    }
}
