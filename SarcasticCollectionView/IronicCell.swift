//
//  IronicCell.swift
//  SarcasticCollectionView
//
//  Created by Antonio Alves on 4/26/21.
//

import UIKit

class IronicCell: UICollectionViewCell {
    
    static let identifier = String(describing: IronicCell.self)
        
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
    
    lazy var widthConstraint: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(contentTitleLabel)
        stackView.addArrangedSubview(contentDescriptionLabel)
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        widthConstraint.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with content: Content) {

        contentTitleLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        contentDescriptionLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        contentTitleLabel.text = "A Section"
        contentDescriptionLabel.text = content.text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
