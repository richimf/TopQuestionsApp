//
//  IndicatorLabel.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

final class IndicatorLabel: UILabel {
    
    private let customTint: UIColor? = {
        return UIColor(named: "BlueTwit-Light")
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    func commonInit() {
        self.text = "---"
        self.numberOfLines = 0
        self.backgroundColor = .clear
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.textAlignment = .left
        self.contentMode = .topLeft
        self.adjustsFontSizeToFitWidth = true
        self.textColor = customTint
    }
}
