//
//  Protocols.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

protocol FetchQuestionsProtocol {
  func getQuestions()
}

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

protocol PresenterProtocol: AnyObject, FetchQuestionsProtocol, DetailViewProtocol {
  var view: ViewProtocol? { get set }
  var interactor: InteractorInputProtocol? { get set}
  var router: RouterProtocol? { get set }
  // VIEW -> PRESENTER
  // var data: [Data]? { get set }
}

protocol InteractorInputProtocol: AnyObject, FetchQuestionsProtocol {
  var presenter: InteractorOutputProtocol? { get set}
  // PRESENTER -> INTERACTOR
}

protocol InteractorOutputProtocol: AnyObject {
  // INTERACTOR -> PRESENTER
 // func updateData(data: [Data])
  func showError()
}

protocol RouterProtocol: AnyObject, DetailViewProtocol {
  // PRESENTER -> ROUTER
}
