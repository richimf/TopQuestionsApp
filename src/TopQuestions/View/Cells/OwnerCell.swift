//
//  OwnerCell.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

final class OwnerCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textAlignment = .left
        lbl.contentMode = .topLeft
        return lbl
    }()

    private let countLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textAlignment = .left
        lbl.contentMode = .topLeft
        return lbl
    }()

    private let profilePic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icProfile")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .none
        setupStack()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setWithHeightAnchorTo(constant: CGFloat, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: constant).isActive = true
        view.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func setProfilePicture(image: UIImage?) {
        guard let image = image else { return }
        profilePic.image = image
    }

    func setName(_ name: String?, count: Int?) {
        nameLabel.text = name ?? ""
        countLabel.text = "\(count ?? 0)"
    }

    private func setupStack() {
        let stackViewInfo = UIStackViewAnchor(arrangedSubviews: [nameLabel, countLabel])
        stackViewInfo.distribution = .fillEqually
        stackViewInfo.axis = .vertical
        stackViewInfo.alignment = .leading
        stackViewInfo.spacing = 5
        let stackView = UIStackViewAnchor(arrangedSubviews: [profilePic, stackViewInfo])
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 5
        addSubview(stackView)
        setWithHeightAnchorTo(constant: 35.0, view: profilePic)
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 5).isActive = true
        profilePic.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width/2).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
}
