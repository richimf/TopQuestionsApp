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
    
    // TODO: GO TO DETAIL VIEW FUNCTION
    func showDetail(of data: Item, from viewController: UIViewController) {
        let vc = DetailViewController()
//        vc.setData(data: data)
        viewController.navigationController?.navigationBar.topItem?.title = "Question"
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
