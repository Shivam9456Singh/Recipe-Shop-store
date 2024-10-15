//
//  DetailGroceryViewController.swift
//  Recipe book
//
//  Created by Shivam Kumar on 13/10/24.
//

import Foundation
import UIKit

class DetailGroceryViewController: UIViewController {
    
    let detailGrocery = DetailGroceryView()
    var productData : GroceryModel?
    
    let buyNowButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy Now", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .systemOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    let addToCartbutton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "cart.fill.badge.plus")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemGreen), for: .normal)
        return button
    }()
    
    let itemInCartLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.text = "1"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailGrocery.reviewTableView.dataSource = self
        detailGrocery.reviewTableView.delegate = self
        detailGrocery.reviewTableView.register(CustomReviewCell.self, forCellReuseIdentifier: CustomReviewCell.identifier)
        detailGrocery.reviewTableView.rowHeight = UITableView.automaticDimension
        detailGrocery.saveButton.isEnabled = true
        detailGrocery.saveButton.isUserInteractionEnabled = true
        updateUI()
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailGrocery.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buyNowButton)
        view.addSubview(addToCartbutton)
        view.addSubview(itemInCartLabel)
        view.addSubview(detailGrocery)
        NSLayoutConstraint.activate([
            detailGrocery.topAnchor.constraint(equalTo: view.topAnchor),
            detailGrocery.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailGrocery.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buyNowButton.topAnchor.constraint(equalTo: detailGrocery.bottomAnchor,constant: 10),
            buyNowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            buyNowButton.widthAnchor.constraint(equalToConstant: 250),
            buyNowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
            
            addToCartbutton.topAnchor.constraint(equalTo: detailGrocery.bottomAnchor, constant: 10),
            addToCartbutton.leadingAnchor.constraint(equalTo: buyNowButton.trailingAnchor,constant: 10),
            addToCartbutton.widthAnchor.constraint(equalToConstant: 45),
            addToCartbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
            
            itemInCartLabel.topAnchor.constraint(equalTo: detailGrocery.bottomAnchor, constant: 10),
            itemInCartLabel.leadingAnchor.constraint(equalTo: addToCartbutton.trailingAnchor, constant: 5),
            itemInCartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemInCartLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
        ])
    }
    
    
    
    func updateUI(){
        detailGrocery.saveButton.addTarget(self, action: #selector(saveItem), for: .touchUpInside)
        buyNowButton.addTarget(self, action: #selector(buyNow), for: .touchUpInside)
        addToCartbutton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
    }
    
    var isSaved : Bool = false
    
    @objc func saveItem(_ sender : UIButton){
        if isSaved {
            detailGrocery.saveButton.setImage(UIImage(systemName: "bookmark")?.withRenderingMode(.alwaysOriginal), for: .normal)
            isSaved = false
        }
        else{
            detailGrocery.saveButton.setImage(UIImage(systemName: "bookmark.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
            isSaved = true
        }
        
    }
    
    @objc func buyNow(){
        let buyNowVC = BuyNowViewController()
        navigationController?.pushViewController(buyNowVC, animated: true)
    }
    
    @objc func addToCart(){
        
    }

    
    func configure(with viewModel: GroceryModel) {
        
        productData = viewModel
        detailGrocery.reviewTableView.reloadData()
        
        let cacheKey = NSString(string: viewModel.images[0])
        
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            self.detailGrocery.productImageView.image = cachedImage
        } else {
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let self = self else { return }
                guard let url = URL(string: viewModel.images[0]), let data = try? Data(contentsOf: url), let downloadedImage = UIImage(data: data) else { return }
                imageCache.setObject(downloadedImage, forKey: cacheKey)
                DispatchQueue.main.async {
                    self.detailGrocery.productImageView.image = downloadedImage
                }
            }
        }
        
        // Define fonts
        let titleFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        let valueFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        // Assign attributed text using helper function
        detailGrocery.productTitleLabel.attributedText = createAttributedText(title: "Product", value: viewModel.title, titleFont: titleFont, valueFont: valueFont)
        detailGrocery.productDescriptionLabel.attributedText = createAttributedText(title: "Description", value: viewModel.description, titleFont: titleFont, valueFont: valueFont)
        detailGrocery.categoryLabel.attributedText = createAttributedText(title: "Category", value: viewModel.category ?? "NA", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.warrantyLabel.attributedText = createAttributedText(title: "Warranty", value: viewModel.warrantyInformation ?? "NA", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.shippingLabel.attributedText = createAttributedText(title: "Delivery Time", value: viewModel.shippingInformation ?? "NA", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.ratingsLabel.attributedText = createAttributedText(title: "Rating", value: "\(viewModel.rating ?? 0) ⭐️", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.stockLabel.attributedText = createAttributedText(title: "In Stock", value: "\(viewModel.stock ?? 0)", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.priceLabel.attributedText = createAttributedText(title: "Price", value: "₹ \(String(format : "%.2f",(viewModel.price ?? 0.0) * 84.08))", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.discountLabel.attributedText = createAttributedText(title: "Discount", value: "\(viewModel.discountPercentage ?? 0.0) %", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.availabilityLabel.attributedText = createAttributedText(title: "Availability", value: viewModel.availability ?? "Out of Stock", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.returnPolicy.attributedText = createAttributedText(title: "Return Policy", value: viewModel.returnPolicy ?? "No Return", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.minimumOrderLabel.attributedText = createAttributedText(title: "Min. Order", value: "\(viewModel.minimumOrderQuantity ?? 0)", titleFont: titleFont, valueFont: valueFont)
        detailGrocery.brandLabel.attributedText = createAttributedText(title: "Brand", value: viewModel.brand ?? "Unknown", titleFont: titleFont, valueFont: valueFont)
    }
    
    // Helper function to create attributed strings
    private func createAttributedText(title: String, value: String, titleFont: UIFont, valueFont: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(
            string: "\(title): ",
            attributes: [NSAttributedString.Key.font: titleFont]
        )
        let valueString = NSAttributedString(
            string: value,
            attributes: [NSAttributedString.Key.font: valueFont]
        )
        attributedString.append(valueString)
        return attributedString
    }
}

extension DetailGroceryViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomReviewCell.identifier, for: indexPath) as? CustomReviewCell else {return UITableViewCell()}
        if let review = productData?.reviews?[indexPath.row] {
            cell.configure(with :review)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
