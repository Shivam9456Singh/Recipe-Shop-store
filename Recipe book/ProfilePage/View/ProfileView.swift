//
//  ProfileView.swift
//  Recipe book
//
//  Created by Shivam Kumar on 06/10/24.
//

import Foundation
import UIKit

class ProfileView : UIView {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .quaternarySystemFill
        view.layer.cornerRadius = 20
        return view
    }()
    
    let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "kaby")
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let profileNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.text = "Kabby Lame"
        label.textAlignment = .natural
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(tableView)
        addSubview(containerView)
        containerView.addSubview(profileImage)
        containerView.addSubview(profileNameLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 130),
            
            profileImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20),
            profileImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            profileNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 20),
            profileNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            profileNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor,constant: 50),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
