//
//  GroceryHeaderView.swift
//  Recipe book
//
//  Created by Shivam Kumar on 08/10/24.
//

import Foundation
import UIKit

class GroceryHeaderView : UICollectionReusableView {
    
    static let identifier = "GroceryHeaderView"
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let headerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "grocery")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImageView)
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor,constant: 50),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
