//
//  ViewSafeAreaProtocol.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

protocol ViewSafeAreaProtocol {
  func setupAnchorWithSafeArea(container view: UIView, safeArea: UILayoutGuide)
}
extension ViewSafeAreaProtocol where Self: UIView {
  /// This functions should be added after adding the view on the container.
  func setupAnchorWithSafeArea(container view: UIView, safeArea: UILayoutGuide) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
    self.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
    self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    self.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
  }
}
