//
//  DetailGroceryView.swift
//  Recipe book
//
//  Created by Shivam Kumar on 13/10/24.
//

import Foundation
import UIKit

class DetailGroceryView : UIView {
    
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let saveButton : UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bookmark")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let productTitleLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Product"
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let brandLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "brand "
        return label
    }()
    
    
    let productDescriptionLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product summary"
        label.numberOfLines = 0
        return label
    }()
    
    let ratingsLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "ratings "
        label.textColor = .label
        return label
    }()
    
    
    let categoryLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "product category "
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    
    
    let stockLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "stock "
        label.textColor = .label
        return label
    }()
    
    
    let priceLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "price "
        label.textColor = .label
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        return label
    }()
    
    let discountLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "discount "
        label.textColor = .label
        return label
    }()
    
    
    let warrantyLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "warranty "
        label.textColor = .label
        return label
    }()
    
    
    let shippingLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Delivery in "
        label.textColor = .label
        return label
    }()
    
    
    let availabilityLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "availability status "
        label.textColor = .label
        return label
    }()
    
    let returnPolicy : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "return policy "
        label.textColor = .label
        return label
    }()
    
    let minimumOrderLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "minimum order "
        label.textColor = .label
        return label
    }()
    
    let reviewsLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reviews:"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
   
    
    
    let reviewTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(productDescriptionLabel)
        containerView.addSubview(ratingsLabel)
        containerView.addSubview(categoryLabel)
        containerView.addSubview(stockLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(discountLabel)
        containerView.addSubview(warrantyLabel)
        containerView.addSubview(shippingLabel)
        containerView.addSubview(availabilityLabel)
        containerView.addSubview(returnPolicy)
        containerView.addSubview(minimumOrderLabel)
        containerView.addSubview(brandLabel)
        containerView.addSubview(saveButton)
        containerView.addSubview(reviewsLabel)
        containerView.addSubview(reviewTableView)
        setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20),
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            productImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            productImageView.heightAnchor.constraint(equalToConstant: 300),
            
            
            saveButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            
            
            productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            productTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            

            productDescriptionLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 20),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),

            priceLabel.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            priceLabel.widthAnchor.constraint(equalToConstant: 200),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            discountLabel.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 20),
            discountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 50),
            discountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
           
            ratingsLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            ratingsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            ratingsLabel.widthAnchor.constraint(equalToConstant: 200),
        

            categoryLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            categoryLabel.leadingAnchor.constraint(equalTo: ratingsLabel.trailingAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            
            stockLabel.topAnchor.constraint(equalTo: ratingsLabel.bottomAnchor, constant: 20),
            stockLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            stockLabel.widthAnchor.constraint(equalToConstant: 200),
            

            brandLabel.topAnchor.constraint(equalTo: stockLabel.bottomAnchor, constant: 20),
            brandLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            brandLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            minimumOrderLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20),
            minimumOrderLabel.leadingAnchor.constraint(equalTo: stockLabel.trailingAnchor, constant: 10),
            minimumOrderLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),

            warrantyLabel.topAnchor.constraint(equalTo: minimumOrderLabel.bottomAnchor, constant: 20),
            warrantyLabel.leadingAnchor.constraint(equalTo: brandLabel.trailingAnchor, constant: 5),
            warrantyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            shippingLabel.topAnchor.constraint(equalTo: warrantyLabel.bottomAnchor, constant: 20),
            shippingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            shippingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            availabilityLabel.topAnchor.constraint(equalTo: shippingLabel.bottomAnchor, constant: 20),
            availabilityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            availabilityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            returnPolicy.topAnchor.constraint(equalTo: availabilityLabel.bottomAnchor, constant: 20),
            returnPolicy.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            returnPolicy.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            reviewsLabel.topAnchor.constraint(equalTo: returnPolicy.bottomAnchor, constant: 20),
            reviewsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            reviewsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            reviewTableView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor,constant: 20),
            reviewTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            reviewTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            reviewTableView.heightAnchor.constraint(equalToConstant: 250),
            reviewTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
