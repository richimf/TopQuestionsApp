//
//  Protocols.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

// MARK: - VIPER Protocols
protocol ViewProtocol: AnyObject {
    var presenter: PresenterProtocol? { get set}
    // PRESENTER -> VIEW
    func loadQuestions()
    func showError()
}

protocol PresenterProtocol: AnyObject {
    var view: ViewProtocol? { get set }
    var interactor: InteractorInputProtocol? { get set}
    var router: RouterProtocol? { get set }
    // VIEW -> PRESENTER
    var questionItems: [Item] { get set }
    func getQuestions()
    func getQuestionDetail(questionId: String, filter: String)
    func showDetail(of data: Item, from viewController: UIViewController)
}

protocol InteractorInputProtocol: AnyObject {
    var presenter: InteractorOutputProtocol? { get set}
    // PRESENTER -> INTERACTOR
    func getQuestions(with queries: [URLQueryItem]?)
    func getQuestionsDetailsFor(questionId: String, with queries: [URLQueryItem]?)
}

protocol InteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func updateData(with response: Response)
    func showError()
}

protocol RouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    func showDetail(of data: Item, from viewController: UIViewController)
}
