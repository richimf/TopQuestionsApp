//
//  ViewController.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

private class UITableViewSafeArea: UITableView, ViewSafeAreaProtocol {

    func setup(delegate: UITableViewDelegate, datasource: UITableViewDataSource, register cellClass: AnyClass?, id cellId: String) {
        self.dataSource = datasource
        self.delegate = delegate
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = rowHeight
        self.register(cellClass.self, forCellReuseIdentifier: cellId)
    }
}

final class ViewController: UIViewController {

    // MARK: - PROPERTIES
    private let tableView: UITableViewSafeArea = UITableViewSafeArea()
    private let cellId: String = "cellId"
    private let rowHeight: CGFloat = 110

    // MARK: - VIPER
    var presenter: PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // VIPER CONNECTION
        Router.createModule(view: self)
        presenter?.getQuestions()
        tableView.setup(delegate: self, datasource: self, register: QuestionCell.self, id: cellId)
        //presenter?.getQuestionDetail(questionId: "56433665", filter: "!9_bDDxJY5")
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//      super.viewWillDisappear(animated)
//      self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        tableView.setupAnchorWithSafeArea(container: self.view, safeArea: view.layoutMarginsGuide)
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
        //
    }
}
// MARK: - EXTENSIONS
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.questionItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedData = presenter?.questionItems[indexPath.row] else { return }
        presenter?.showDetail(of: selectedData, from: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                       for: indexPath) as? QuestionCell else { return UITableViewCell() }
        let title = presenter?.questionItems[indexPath.row].title ?? ""
        cell.setValue(title)
        return cell
    }
}

