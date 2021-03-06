//
//  ViewController.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - PROPERTIES
    private let tableView: UITableViewSafeArea = UITableViewSafeArea()
    private let cellId: String = "cellId"

    // MARK: - VIPER
    var presenter: PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // VIPER CONNECTION
        Router.createModule(view: self)
        presenter?.getQuestions()
        tableView.setup(delegate: self, datasource: self)
        tableView.registerCell(register: QuestionCell.self, id: cellId)
        tableView.separatorStyle = .singleLine
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        tableView.setupAnchorWithSafeArea(container: self.view, safeArea: view.safeAreaLayoutGuide)
    }

    override func viewDidLayoutSubviews() {
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
}

// MARK: - VIPER
extension ViewController: ViewProtocol {
    func loadQuestions() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError() {
        UIAlertHelper.showErrorAlert(context: self)
    }
}
// MARK: - EXTENSIONS
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.questionItems.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedData = presenter?.questionItems[indexPath.row] else { return }
        presenter?.showDetail(of: selectedData, from: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                       for: indexPath) as? QuestionCell,
             let item = presenter?.questionItems[indexPath.row] else { return UITableViewCell() }
        cell.setValue(item)
        return cell
    }
}

