//
//  Router.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

final class Router: RouterProtocol {

    private typealias PresenterProtocols = PresenterProtocol & InteractorOutputProtocol

    //SETUP INITIAL VIPER MODULE
     class func createModule(view: ViewProtocol) {
       let presenter: PresenterProtocols = Presenter()
       view.presenter = presenter
       view.presenter?.router = Router()
       view.presenter?.view = view
       view.presenter?.interactor = Interactor()
       view.presenter?.interactor?.presenter = presenter
     }

    func showDetail(of data: Item, from viewController: UIViewController) {
        let viewModel = DetailViewModel()
        viewModel.questionId = data.questionId

        let vc = DetailViewController()
        vc.viewModel = viewModel
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
