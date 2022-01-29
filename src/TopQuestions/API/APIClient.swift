//
//  APIClient.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//


import Foundation

protocol APIResponseProtocol: AnyObject {
    func fetched(response: Response)
    func error()
}

/// Question Listing
/// https[:]//api.stackexchange.com/2.2/questions?site=stackoverflow&order=desc&sort=votes&tagged=swiftui&pagesize=10
/// Question Detail
/// https[:]//api.stackexchange.com/2.2/questions/56433665?site=stackoverflow&order=desc&sort=votes&tagged=swiftui&pagesize=10&filter=!9_bDDxJY5
enum APIURL: String {
    case scheme = "https"
    case host = "api.stackexchange.com"
    case path = "/2.2/questions"
}

final class APIClient {

    var delegate: APIResponseProtocol?

    private var components = URLComponents()

    init() {
        components.scheme = APIURL.scheme.rawValue
        components.host = APIURL.host.rawValue
    }

    func setQueryItems(with queries: [URLQueryItem]?) {
        components.path = APIURL.path.rawValue
        components.queryItems = queries
    }

    func fetchQuestions() {
        guard let url = components.url else { return }
        performRequest(of: url)
    }

    func fetchQuestionDetailsFor(questionId: Int) {
        components.path = APIURL.path.rawValue + "/\(questionId)"
        guard let url = components.url else { return }
        performRequest(of: url)
    }

    private func performRequest(of url: URL) {
        let request = URLRequest(url: url)
        let task =  URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            // Handling error cases:
            if error != nil {
                self.delegate?.error()
                return
            }
            guard let data = data else {
                self.delegate?.error()
                return
            }
            // Serialize the data into an object if success:
            guard let decodedData = try? JSONDecoder().decode(Response.self, from: data) else {
                self.delegate?.error()
                return
            }
            self.delegate?.fetched(response: decodedData)
        })
        task.resume()
    }

    /// This function is only executed with DEBUG schemes.
    func loadJsonData(file: String) {
        if let jsonFilePath = Bundle(for: type(of:  self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            if let data = try? Data(contentsOf: jsonFileURL) {
                if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
                    self.delegate?.fetched(response: decodedData)
                }
            }
        }
    }

}
