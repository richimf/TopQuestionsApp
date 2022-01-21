//
//  ViewController.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - VIPER
    var presenter: PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // VIPER CONNECTION
        Router.createModule(view: self)
        presenter?.getQuestions()
//        presenter?.getQuestionDetail(questionId: "56433665", filter: "!9_bDDxJY5")
    }
}
extension ViewController: ViewProtocol {
    func loadQuestions() {
        print("works")
    }
    
    func showError() {
        //
    }
}
