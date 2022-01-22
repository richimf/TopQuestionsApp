//
//  CellSeparator.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

protocol ViewWithSeparatorStyle {
  func showDivision()
}
extension ViewWithSeparatorStyle where Self: UIView {

  func showDivision() {
    var separator: UIView = UIView(frame: .zero)
    self.addSubview(separator)
    setupDivisor(view: &separator)
    separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }

  private func setupDivisor(view: inout UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
    view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    view.backgroundColor = UIColor.lightGray
  }
}
