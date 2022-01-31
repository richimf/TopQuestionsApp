//
//  QuestionCell.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

extension UITableViewCell {
    func getDefaultId() -> String {
        return String(self.description)
    }
}

class QuestionCell: UITableViewCell {
    
    private let questionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.contentMode = .topLeft
        return lbl
    }()
    
    private let tagsLabel: IndicatorLabel = {
        let lbl = IndicatorLabel()
        lbl.textColor = UIColor(named: "BlueTwit")
        lbl.font = UIFont.boldSystemFont(ofSize: 11)
        return lbl
    }()
    
    private let dateLabel: IndicatorLabel = {
        let lbl = IndicatorLabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()

    private let indicatorsStackView: IndicatorView = IndicatorView()

    // MARK: - OVERRIDES
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        setupStackContainer()
        self.accessoryType = .disclosureIndicator
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false
        tagsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        indicatorsStackView.translatesAutoresizingMaskIntoConstraints = false
        indicatorsStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupStackContainer() {
        let stackView = UIStackViewAnchor(arrangedSubviews: [questionLabel, tagsLabel, dateLabel, indicatorsStackView])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)
        let stackAnchor = Anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        let stackPadding = Padding(top: 5, left: 15, bottom: 15, right: 40)
        stackView.anchor(anchor: stackAnchor, padding: stackPadding, width: frame.width, height: frame.height)
    }

    func setValue(_ item: Item) {
        self.questionLabel.text = item.title
        self.tagsLabel.text = item.tags?.joined(separator: ", ")
        self.dateLabel.text = DateUtil.getAskedDate(from: item.lastEditDate)
        guard let score = item.score, let ansCount = item.answerCount, let viewCount = item.viewCount else { return }
        indicatorsStackView.updateIndicatorValues(score: score, answers: ansCount, views: viewCount)
    }
}
