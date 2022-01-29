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
    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        viewModel.delegate = self
        viewModel.tableView = tableView
        tableView.setup(delegate: self, datasource: viewModel)
        viewModel.getQuestionDetail()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Question"
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

extension DetailViewController: DetailViewModelDelegate {
    func reloadView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

