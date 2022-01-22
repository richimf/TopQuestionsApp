//
//  IconIndicator.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

final class IconIndicator: UIImageView {
    
    private let customTint: UIColor? = {
        return UIColor(named: "BlueTwit-Light")
    }()
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.frame =  CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        self.contentMode = .scaleAspectFit
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.clipsToBounds = true
        self.tintColor = customTint
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setWithAnchorTo(constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
}
