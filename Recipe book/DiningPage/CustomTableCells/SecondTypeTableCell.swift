//
//  SecondTypeTableCell.swift
//  Recipe book
//
//  Created by Shivam Kumar on 07/10/24.
//

import Foundation
import UIKit

class SecondTypeTableCell : UITableViewCell {
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .tertiarySystemFill
        view.layer.cornerRadius = 20
        return view
    }()
    
    let dishImageView : UIImageView = {
          let imageview = UIImageView()
           imageview.translatesAutoresizingMaskIntoConstraints = false
           imageview.contentMode = .scaleAspectFill
           imageview.clipsToBounds = true
           imageview.layer.cornerRadius = 20
           return imageview
       }()
       
       let dishTitleLabel : UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 0
           label.font = .systemFont(ofSize: 20, weight: .regular)
           return label
       }()
       
       let dishSummaryLabel : UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 0
           label.font = .systemFont(ofSize: 16, weight: .thin)
           return label
       }()
    
    let servingsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let cookInMunitesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let caloriesPerServingsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let ratingsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dishImageView.image = UIImage(systemName: "photo.artframe")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        dishTitleLabel.text = nil
        dishSummaryLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ title : String , _ summary : String, _ image : String, _ servings : Int, _ cookingTime: Int, _ caloriesAmount : Int, _ ratings : Float ){
        self.dishTitleLabel.text = title
        self.dishSummaryLabel.text = "Cuisine : \(summary)"
        
        let cacheKey = NSString(string: image)
        
        if let cachedImage = imageCache.object(forKey: cacheKey){
            self.dishImageView.image = cachedImage
        }else{
            DispatchQueue.global(qos : .background).async {
                [weak self] in
                guard let url = URL(string: image), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
                DispatchQueue.main.async{
                    self?.dishImageView.image = image
                }
            }
        }
       
        self.servingsLabel.text = "Servings: \(servings)"
        self.cookInMunitesLabel.text = "Time: \(cookingTime) minutes"
        self.caloriesPerServingsLabel.text = "Calories : \(caloriesAmount) 🍽️"
        self.ratingsLabel.text = "Ratings: \(ratings)/5 ⭐️"
    }
    
    func setupView(){
        contentView.addSubview(containerView)
        containerView.addSubview(dishImageView)
        containerView.addSubview(dishTitleLabel)
        containerView.addSubview(dishSummaryLabel)
        containerView.addSubview(servingsLabel)
        containerView.addSubview(cookInMunitesLabel)
        containerView.addSubview(caloriesPerServingsLabel)
        containerView.addSubview(ratingsLabel)
        
               
               NSLayoutConstraint.activate([
                   containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 50),
                   containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                   containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                   containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                   
                   dishImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
                   dishImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                   dishImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                   dishImageView.heightAnchor.constraint(equalToConstant: 250),
                   
                   dishTitleLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor,constant: 10),
                   dishTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
                   dishTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
                   
                   dishSummaryLabel.topAnchor.constraint(equalTo: dishTitleLabel.bottomAnchor,constant: 10),
                   dishSummaryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
                   dishSummaryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
                   
                   servingsLabel.topAnchor.constraint(equalTo: dishSummaryLabel.bottomAnchor,constant: 10),
                   servingsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
                   servingsLabel.widthAnchor.constraint(equalToConstant: 150),
                   
                   cookInMunitesLabel.topAnchor.constraint(equalTo: dishSummaryLabel.bottomAnchor,constant: 10),
                   cookInMunitesLabel.leadingAnchor.constraint(equalTo: servingsLabel.trailingAnchor,constant: 5),
                   cookInMunitesLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                   
                   caloriesPerServingsLabel.topAnchor.constraint(equalTo: servingsLabel.bottomAnchor,constant: 10),
                   caloriesPerServingsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
                   caloriesPerServingsLabel.widthAnchor.constraint(equalToConstant: 200),
                   
                   ratingsLabel.topAnchor.constraint(equalTo: cookInMunitesLabel.bottomAnchor, constant: 10),
                   ratingsLabel.leadingAnchor.constraint(equalTo: caloriesPerServingsLabel.trailingAnchor, constant: 5),
                   ratingsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
                   ratingsLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -10),
                   
               ])
    }
    
}
