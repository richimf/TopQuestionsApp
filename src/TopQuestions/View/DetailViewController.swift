//
//  DetailViewController.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - PROPERTIES
    private let tableView: UITableViewSafeArea = UITableViewSafeArea()
    private let questionCellId: String = "questionCellId"
    private let bodyCellId: String = "bodyCellId"
    private let ownerCellId: String = "ownerCellId"
    private let rows: Int = 3
    
    var data: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setup(delegate: self, datasource: self)
        tableView.registerCell(register: QuestionCellDetail.self, id: questionCellId)
        tableView.registerCell(register: UITableViewCell.self, id: bodyCellId)
        tableView.registerCell(register: UITableViewCell.self, id: ownerCellId)
        tableView.separatorStyle = .none
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Question"
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        tableView.setupAnchorWithSafeArea(container: self.view, safeArea: view.safeAreaLayoutGuide)
    }
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let data = self.data, let cell = tableView.dequeueReusableCell(withIdentifier: questionCellId, for: indexPath) as? QuestionCellDetail else
            { return UITableViewCell() }
            cell.setValue(data)
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: bodyCellId, for: indexPath) as? UITableViewCell else
            { return UITableViewCell() }
            cell.textLabel?.text = "some body large text"
            return cell
        }else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ownerCellId, for: indexPath) as? UITableViewCell else
            { return UITableViewCell() }
            cell.textLabel?.text = "some body large text"
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
