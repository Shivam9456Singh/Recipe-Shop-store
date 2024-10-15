//
//  FirstTypeCell.swift
//  Recipe book
//
//  Created by Shivam Kumar on 08/10/24.
//

import Foundation
import UIKit

class FirstTypeCell : UICollectionViewCell {
    
    //MARK: - containerSubViews
    
    var containerView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .tertiarySystemFill
        view.layer.cornerRadius = 10
        return view
    }()
    
    let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let productTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let productSummaryLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    let productPriceLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        productTitleLabel.text = nil
        productSummaryLabel.text = nil
    }
    
    //MARK: - cellConfiguration
    
    func configureCell(title : String, image : String, summary : String, indexPath : IndexPath,productPrice : Double, imageCache : NSCache<NSString,UIImage>){
        self.productTitleLabel.text = title
        self.productSummaryLabel.text = summary
        self.productPriceLabel.text = "Price : ₹ \(String(format : "%.2f" , productPrice * 84.07))"
        self.tag = indexPath.item
        
        let cacheKey = NSString(string: image)
        
        if let cachedImage = imageCache.object(forKey: cacheKey){
            self.productImageView.image = cachedImage
            
        }else{
            DispatchQueue.global(qos : .background).async {
                [weak self] in
                guard let self = self else {return}
                guard let url = URL(string: image), let data = try? Data(contentsOf: url), let downloadedImage = UIImage(data: data) else { return }
                imageCache.setObject(downloadedImage, forKey: cacheKey)
                DispatchQueue.main.async{
                    if self.tag == indexPath.item{
                        self.productImageView.image = downloadedImage
                    }
                       
                }
            }
        }
        
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupViews
    
    func setupView(){
        contentView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(productSummaryLabel)
        containerView.addSubview(productPriceLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            productTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 5),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -5),
            productTitleLabel.heightAnchor.constraint(equalToConstant: 50),
                        
            productSummaryLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor),
            productSummaryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 5),
            productSummaryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -5),
            productSummaryLabel.heightAnchor.constraint(equalToConstant: 30),
            
            productPriceLabel.topAnchor.constraint(equalTo: productSummaryLabel.bottomAnchor, constant:5),
            productPriceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            productPriceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            productPriceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
    }
    
    
}

