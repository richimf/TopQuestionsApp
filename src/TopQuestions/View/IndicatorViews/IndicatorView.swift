//
//  IndicatorView.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

final class IndicatorView: UIView, ViewWithSeparatorStyle {
        
    // SCORE INDICATOR
    private let scoreIcon: IconIndicator = {
        let icon = IconIndicator(image: UIImage(named: "icCounts"))
            icon.setWithAnchorTo(constant: 18)
        return icon
    }()
    
    private let scoreLabel: IndicatorLabel = {
        let lbl = IndicatorLabel()
        lbl.setWithAnchorTo(constant: 60)
        return lbl
    }()
    
    // ANSWERS INDICATOR
    private let answersIcon: IconIndicator = {
        let icon = IconIndicator(image: UIImage(named: "icMessages"))
            icon.setWithAnchorTo(constant: 18)
        return icon
    }()
    
    private let answersLabel: IndicatorLabel = {
        let lbl = IndicatorLabel()
        lbl.setWithAnchorTo(constant: 50)
        return lbl
    }()
    
    // VIEWS INDICATOR
    private let viewsIcon: IconIndicator = {
        let icon = IconIndicator(image: UIImage(named: "icViews"))
            icon.setWithAnchorTo(constant: 18)
        return icon
    }()
    
    private let viewsLabel: IndicatorLabel = {
        let lbl = IndicatorLabel()
        lbl.setWithAnchorTo(constant: 60)
        return lbl
    }()
    
    private lazy var stackedInfoView: UIStackViewAnchor = {
        var stack = UIStackViewAnchor()
        stack.addArrangedSubview(scoreIcon)
        stack.addArrangedSubview(scoreLabel)
        stack.addArrangedSubview(answersIcon)
        stack.addArrangedSubview(answersLabel)
        stack.addArrangedSubview(viewsIcon)
        stack.addArrangedSubview(viewsLabel)
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func updateIndicatorValues(score: Int, answers: Int, views: Int) {
        self.scoreLabel.text = NumberFormatUtil.formatNumber(score)
        self.answersLabel.text = NumberFormatUtil.formatNumber(answers)
        self.viewsLabel.text = NumberFormatUtil.formatNumber(views)
    }

    private func setupStack() {
        stackedInfoView.alignment = .center
        stackedInfoView.axis = .horizontal
        stackedInfoView.distribution = .fill
        stackedInfoView.spacing = 5.0
        self.addSubview(stackedInfoView)
        let stackAnchor = Anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        let stackPadding = Padding(top: 0, left: 0, bottom: 0, right: 0)
        stackedInfoView.anchor(anchor: stackAnchor, padding: stackPadding, width: frame.width, height: frame.height)
    }
}
