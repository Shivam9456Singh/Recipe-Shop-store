//
//  FirstTypeTableCell.swift
//  Recipe book
//
//  Created by Shivam Kumar on 07/10/24.
//

import Foundation
import UIKit

class FirstTypeTableCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    //MARK: - TableViewCell
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.alwaysBounceHorizontal = true
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        configureCollectionView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func configureCollectionView(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 170),
        ])
        
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CustomCollectionCell else {return UICollectionViewCell()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    

}

//MARK: - CustomCollectionCell

class CustomCollectionCell : UICollectionViewCell {
    
    let dishImage : UIImageView = {
        let dishImage = UIImageView()
        dishImage.translatesAutoresizingMaskIntoConstraints = false
        dishImage.contentMode = .scaleToFill
        dishImage.clipsToBounds = true
        return dishImage
    }()
    
    let dishTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(dishImage)
        contentView.addSubview(dishTitle)
        
        NSLayoutConstraint.activate([
            
            dishImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            dishImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dishImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dishImage.heightAnchor.constraint(equalToConstant: 120),
            
            dishTitle.topAnchor.constraint(equalTo: dishImage.bottomAnchor,constant: 10),
            dishTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dishTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dishTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
