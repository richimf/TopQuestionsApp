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

    func getQuestions() {
        interactor?.getQuestions()
    }
}
extension Presenter: InteractorOutputProtocol {
    func showError() {
        view?.showError()
    }

    // TODO: UPDATE DATA
}
