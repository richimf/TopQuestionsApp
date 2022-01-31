//
//  DetailViewModel.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 29/1/22.
//

import UIKit

protocol DetailViewModelDelegate {
    func reloadView()
}

final class DetailViewModel: NSObject {

    private enum CellIds {
        static let question = "questionCellId"
        static let body = "bodyCellId"
        static let owner = "ownerCellId"
    }

    private let apiClient = APIClient()
    private var data: Item?
    private let rows: Int = 3

    var questionId: Int?
    var delegate: DetailViewModelDelegate?

    weak var tableView: UITableViewSafeArea? {
        didSet {
            tableView?.isHidden = true
            tableView?.allowsSelection = false
            tableView?.registerCell(register: QuestionCellDetail.self, id: CellIds.question)
            tableView?.registerCell(register: UITableViewCell.self, id: CellIds.body)
            tableView?.registerCell(register: OwnerCell.self, id: CellIds.owner)
        }
    }

    func getQuestionDetail() {
        guard let id = questionId else { return }
        apiClient.delegate = self
        #if DEBUG
            self.apiClient.loadJsonData(file: "question-detail")
        #else
            self.fetchQuestionDetail(from: id)
        #endif
    }
    
    private func fetchQuestionDetail(from questionId: Int) {
        let params: [String: String] = [
            "site": "stackoverflow",
            "order": "desc",
            "sort": "votes",
            "tagged": "swiftui",
            "pagesize": "10",
            "filter": "!9_bDDxJY5"]
        let queries: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        apiClient.setQueryItems(with: queries)
        apiClient.fetchQuestionDetailsFor(questionId: questionId)
    }
}
extension DetailViewModel: APIResponseProtocol {

    func fetched(response: Response) {
        self.data = response.items.first
        self.delegate?.reloadView()
    }

    func error() {
        //
    }
}
extension DetailViewModel: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let data = data, let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.question, for: indexPath) as? QuestionCellDetail else
            { return UITableViewCell() }
            cell.setValue(data)
            return cell
        } else
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.body, for: indexPath) as? UITableViewCell else
            { return UITableViewCell() }
            cell.textLabel?.numberOfLines = 0
            if let text = data?.body {
                cell.textLabel?.attributedText = text.htmlToAttributedString
            }
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.owner, for: indexPath) as? OwnerCell else
            { return UITableViewCell() }
            //cell.textLabel?.text = "some body large text"
            cell.setName("name", count: "12345")
            return cell
        }
        return UITableViewCell()
    }
}
