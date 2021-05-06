//
//  IronicCell.swift
//  SarcasticCollectionView
//
//  Created by Antonio Alves on 4/26/21.
//

import UIKit

class IronicCell: UICollectionViewCell {
    
    static let identifier = String(describing: IronicCell.self)
    
    let containerView = UIView()
    
    let contentTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont(name: "Copperplate", size: 24)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    let contentDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont(name: "Chalkduster", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true

        stackView.addArrangedSubview(contentTitleLabel)
        stackView.addArrangedSubview(contentDescriptionLabel)
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with content: Content) {

        containerView.backgroundColor = UIColor(red: 0.93, green: 0.81, blue: 0.68, alpha: 1.00)
        contentTitleLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        contentDescriptionLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        contentTitleLabel.text = "A Section"
        contentDescriptionLabel.text = content.text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
