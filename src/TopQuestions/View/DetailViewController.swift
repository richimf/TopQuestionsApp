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
        tableView.registerCell(register: OwnerCell.self, id: ownerCellId)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Question"
//        self.tableView.reloadData()
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

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let data = self.data, let cell = tableView.dequeueReusableCell(withIdentifier: questionCellId, for: indexPath) as? QuestionCellDetail else
            { return UITableViewCell() }
            cell.setValue(data)
            return cell
        } else
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: bodyCellId, for: indexPath) as? UITableViewCell else
            { return UITableViewCell() }
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "after years of lurking here I’ve got something to contribute! Over the recent year I’ve been working on a web framework for everyone’s favorite language. Its focus is on clean, elegant, full featured APIs and sharing code between Swift clients ⠀and server. There are a couple quickstart projects in there (including one that’s Fullstack; iOS, Backend, Shared all in a single Xcode Project!) to peruse. There’s also a ton of docs that are geared towards fellow Swifters who are just getting started in backend dev. Would love for you guys to check it out and give feedback!"
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ownerCellId, for: indexPath) as? OwnerCell else
            { return UITableViewCell() }
            //cell.textLabel?.text = "some body large text"
            cell.setName("name", count: "12345")
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
