//
//  IndicatorView.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

final class IndicatorView: UIView, ViewWithSeparatorStyle {
    
    private var stackedInfoView = UIStackViewAnchor()
    private var indicators: [(text: String, icon: String)] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup(indicators: [(text: String, icon: String)]) {
        for indicator in indicators {
            let image = IconIndicator(image: UIImage(named: indicator.icon))
            setWithAnchorTo(view: image, constant: 20)
            stackedInfoView.addArrangedSubview(image)
            
            let label = IndicatorLabel()
            label.text = indicator.text
            setWithAnchorTo(view: label, constant: 60)
            stackedInfoView.addArrangedSubview(label)
        }
        setupLabels()
    }
    
    private func setWithAnchorTo(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    private func setupLabels() {
        stackedInfoView.axis = .horizontal
        stackedInfoView.distribution = .fill
        stackedInfoView.spacing = 10.0
        self.addSubview(stackedInfoView)
        let stackAnchor = Anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        let stackPadding = Padding(top: 0, left: 0, bottom: 0, right: 0)
        stackedInfoView.anchor(anchor: stackAnchor, padding: stackPadding, width: frame.width, height: frame.height)
    }
}
