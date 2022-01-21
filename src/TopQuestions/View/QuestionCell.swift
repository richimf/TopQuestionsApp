//
//  QuestionCell.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

class QuestionCell: UITableViewCell, ViewWithSeparatorStyle {
    
    private let contentLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.contentMode = .topLeft
        lbl.backgroundColor = .green
        return lbl
    }()
    
    // MARK: - OVERRIDES
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
        showDivision()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabels() {
        let stackView = UIStackViewAnchor(arrangedSubviews: [contentLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 1
        addSubview(stackView)
        let stackAnchor = Anchor(top: topAnchor, left: contentLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor)
        let stackPadding = Padding(top: 5, left: 5, bottom: 5, right: 5)
        stackView.anchor(anchor: stackAnchor, padding: stackPadding, width: self.frame.width, height: 100, enableInsets: false)
    }
    
    func setValue(_ value: String) {
        self.contentLabel.text = value
    }
}
