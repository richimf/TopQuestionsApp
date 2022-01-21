//
//  Presenter.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

final class Presenter: PresenterProtocol {

    // VIPER connection
    // weak avoids retain cycles
    weak var view: ViewProtocol?
    var interactor: InteractorInputProtocol?
    var router: RouterProtocol?
    var questionItems: [Item] = [ Item(tags: ["tag1, tag2, tag3, tag4"],
                                       owner: nil,
                                       isAnswered: nil,
                                       viewCount: 10,
                                       acceptedAnswerId: nil,
                                       answerCount: 20,
                                       score: 30,
                                       lastActivityDate: 1618731589,
                                       creationDate: 1618731589,
                                       lastEditDate: 1618731589,
                                       questionId: nil,
                                       contentLicense: nil,
                                       link: nil,
                                       title: "Here’s how Stack Overflow users responded to Log4Shell, the Log4j vulnerability affecting almost everyone",
                                       body: "body")]

    func getQuestions() {
        let params: [String: String] = [
            "site": "stackoverflow",
            "order": "desc",
            "sort": "votes",
            "tagged": "swiftui",
            "pagesize": "10"]
        let queries: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        interactor?.getQuestions(with: queries)
    }
    
    func getQuestionDetail(questionId: String, filter: String) {
        let params: [String: String] = [
            "site": "stackoverflow",
            "order": "desc",
            "sort": "votes",
            "tagged": "swiftui",
            "pagesize": "10",
            "filter": filter]
        let queries: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        interactor?.getQuestionsDetailsFor(questionId: questionId, with: queries)
    }
    
    func showDetail(of data: Item, from viewController: UIViewController) {
      router?.showDetail(of: data, from: viewController)
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
