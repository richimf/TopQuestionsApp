//
//  TableViewBuilder.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

class UITableViewSafeArea: UITableView, ViewSafeAreaProtocol {

    func setup(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        self.dataSource = datasource
        self.delegate = delegate
        self.separatorStyle = .none
        self.estimatedRowHeight = .zero
        self.rowHeight = UITableView.automaticDimension
    }

    func registerCell( register cellClass: AnyClass?, id cellId: String) {
        self.register(cellClass.self, forCellReuseIdentifier: cellId)
    }
}
