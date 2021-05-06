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
        label.textColor = .white
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(containerView)
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        containerView.addSubview(contentTitleLabel)
        contentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        contentTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        contentTitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        contentTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        
        //containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        containerView.clipsToBounds = true
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with content: Content) {
        containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

        containerView.backgroundColor = content.backgroundColor
        contentTitleLabel.text = content.text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
