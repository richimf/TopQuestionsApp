//
//  OwnerCell.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import UIKit

class OwnerCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.contentMode = .topLeft
        return lbl
    }()
    
    private let countLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
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

    func setProfilePicture(image: UIImage) {
        profilePic.image = image
    }
    
    func setName(_ name: String, count: String) {
        nameLabel.text = name
        countLabel.text = count
    }
    
    private func setupStack() {
        let stackViewInfo = UIStackViewAnchor(arrangedSubviews: [nameLabel, countLabel])
        stackViewInfo.distribution = .fillProportionally
        stackViewInfo.axis = .vertical
        stackViewInfo.alignment = .leading
        stackViewInfo.backgroundColor = .green
        stackViewInfo.spacing = 5
        let stackView = UIStackViewAnchor(arrangedSubviews: [profilePic, stackViewInfo])
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.backgroundColor = .yellow
        stackView.spacing = 5
        addSubview(stackView)
        setWithHeightAnchorTo(constant: 70.0, view: profilePic)
        profilePic.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        profilePic.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
        profilePic.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 0).isActive = true
        profilePic.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
//        setWithHeightAnchorTo(constant: 80.0, view: stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width/2).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70.0).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true

    }

}
