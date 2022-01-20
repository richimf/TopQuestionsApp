//
//  Router.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

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
    
    
}
