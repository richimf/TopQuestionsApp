//
//  Presenter.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

final class Presenter: PresenterProtocol {

    // VIPER connection
    // weak avoids retain cycles
    weak var view: ViewProtocol?
    var interactor: InteractorInputProtocol?
    var router: RouterProtocol?
    var questionItems: [Item] = []

    func getQuestions() {
        let params: [String: String] = [
            "site": "stackoverflow",
            "order": "desc",
            "sort": "votes",
            "tagged": "swiftui",
            "pagesize": "10"
        ]
        let queries: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        interactor?.getQuestions(with: queries)
    }
}
extension Presenter: InteractorOutputProtocol {
    func updateData(with response: Response) {
        questionItems = response.items
        view?.loadQuestions()
    }

    func showError() {
        view?.showError()
    }
}
