//
//  ViewProtocols.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import UIKit

// MARK: - VIEW ANCHOR SIZE PROTOCOL
protocol ViewSizeProtocol {
  func anchor(anchor: Anchor, padding: Padding?, width: CGFloat, height: CGFloat)
}
extension ViewSizeProtocol where Self: UIView {
  
  func anchor(anchor: Anchor, padding: Padding?, width: CGFloat, height: CGFloat) {

    translatesAutoresizingMaskIntoConstraints = false
      
    if let top = anchor.top, let topPadding = padding?.top {
      self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
    }
    if let left = anchor.left, let leftPadding = padding?.left {
      self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
    }
    if let right = anchor.right, let rightPadding = padding?.right {
      self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
    }
    if let bottom = anchor.bottom, let bottomPadding = padding?.bottom{
      self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
    }
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
  }
}
