//
//  APIClient.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//


import Foundation

protocol APIResponseProtocol: AnyObject {
    func fetched()
    func error()
}

class APIClient {

    var delegate: APIResponseProtocol?
    
    func fetchQuestions() {
        
    }
}
