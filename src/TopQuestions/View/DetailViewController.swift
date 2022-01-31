//
//  DetailViewController.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - PROPERTIES
    private let tableView = UITableViewSafeArea()
    private let spinner = UIActivityIndicatorView(style: .medium)

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
        DispatchQueue.main.async {
            UIView.transition(with: self.navigationController?.view ?? UIView(),
                              duration: 0.35,
                              options: .transitionCrossDissolve,
                              animations: {
                self.navigationController?.navigationBar.topItem?.title = "Question"
            })
        }
    }

    override func loadView() {
        super.loadView()
        setupSpinner()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        tableView.setupAnchorWithSafeArea(container: self.view, safeArea: view.safeAreaLayoutGuide)
    }

    override func viewDidLayoutSubviews() {
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = UIColor(named: "BlueTwit")
        self.view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func reloadView() {
        DispatchQueue.main.async {
            UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: {
                self.tableView.reloadData()
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                self.tableView.isHidden = false })
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
}

