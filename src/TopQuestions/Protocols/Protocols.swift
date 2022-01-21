//
//  Protocols.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

protocol DetailViewProtocol {
    // func showDetail(data: Question, from view: UIViewController)
}

// MARK: - VIPER Protocols
protocol ViewProtocol: AnyObject {
    var presenter: PresenterProtocol? { get set}
    // PRESENTER -> VIEW
    func loadQuestions()
    func showError()
}

protocol PresenterProtocol: AnyObject, DetailViewProtocol {
    var view: ViewProtocol? { get set }
    var interactor: InteractorInputProtocol? { get set}
    var router: RouterProtocol? { get set }
    // VIEW -> PRESENTER
    var questionItems: [Item] { get set }
    func getQuestions()
}

protocol InteractorInputProtocol: AnyObject {
    var presenter: InteractorOutputProtocol? { get set}
    // PRESENTER -> INTERACTOR
    func getQuestions(with queries: [URLQueryItem]?)
}

protocol InteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func updateData(with response: Response)
    func showError()
}

protocol RouterProtocol: AnyObject, DetailViewProtocol {
    // PRESENTER -> ROUTER
}
