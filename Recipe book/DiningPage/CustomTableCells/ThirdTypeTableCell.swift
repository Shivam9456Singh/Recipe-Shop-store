//
//  CustomTableViewCell.swift
//  Recipe book
//
//  Created by Shivam Kumar on 07/10/24.
//

import Foundation
import UIKit

class ThirdTypeTableViewCell : UITableViewCell {
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .quaternarySystemFill
        view.layer.cornerRadius = 20
        return view
    }()
    
    let dishImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "chickencurry")
        return imageView
    }()
    
    let dishTitleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Dish title"
        return label
    }()
    
    let dishSummaryLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "Dish summary"
        return label
    }()
    
    let verticalStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 0
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        contentView.addSubview(verticalStackView)
        contentView.addSubview(containerView)
        containerView.addSubview(dishImageView)
        verticalStackView.addArrangedSubview(dishTitleLabel)
        verticalStackView.addArrangedSubview(dishSummaryLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 120),
            
            dishImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dishImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dishImageView.widthAnchor.constraint(equalToConstant: 150),
            dishImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor,constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}

