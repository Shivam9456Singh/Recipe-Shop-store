//
//  TableHeaderView.swift
//  Recipe book
//
//  Created by Shivam Kumar on 07/10/24.
//

import Foundation

import UIKit

class TableHeaderView : UIView {

    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let headerBackgroundImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "headerBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeaderView() {
        addSubview(headerView)
        headerView.addSubview(headerBackgroundImage)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerBackgroundImage.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerBackgroundImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerBackgroundImage.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerBackgroundImage.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
        ])
    }
}
