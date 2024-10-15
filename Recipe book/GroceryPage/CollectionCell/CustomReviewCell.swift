//
//  CustomReviewCell.swift
//  Recipe book
//
//  Created by Shivam Kumar on 14/10/24.
//

import Foundation
import UIKit

class CustomReviewCell : UITableViewCell {
    
    static let identifier = "tableCell"
    
    let reviewerName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Review name"
        label.numberOfLines = 0
        return label
    }()
    
    let reviewComment : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Review comment"
        label.numberOfLines = 0
        return label
    }()
    
    let reviewDate : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.text = "Review date"
        return label
    }()
    
    let reviewerRating : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.text = "Review ratings"
        return label
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with reviewModel : GroceryModel.Review){
        reviewerName.text = "👤 \(reviewModel.reviewerName)"
        reviewComment.text = reviewModel.comment
        reviewerRating.text = "\(reviewModel.rating)/5 ⭐️"
        
        if let dateString = reviewModel.date?.trimmingCharacters(in: .whitespacesAndNewlines) {
            
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime , .withFractionalSeconds]
            
            if let date = isoFormatter.date(from: dateString) {
                let displayFormatter = DateFormatter()
                displayFormatter.dateStyle = .medium
                displayFormatter.timeStyle = .short
                reviewDate.text = displayFormatter.string(from: date)
            }else{
                print("Failed to parse date string")
                reviewDate.text = "nil"
            }
        }
    }
    
    func setupCell(){
        
        contentView.addSubview(containerView)
        containerView.addSubview(reviewerName)
        containerView.addSubview(reviewDate)
        containerView.addSubview(reviewComment)
        containerView.addSubview(reviewerRating)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            reviewerName.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 10),
            reviewerName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            reviewerName.widthAnchor.constraint(equalToConstant: 150),
            
            reviewerRating.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            reviewerRating.leadingAnchor.constraint(equalTo: reviewerName.trailingAnchor, constant: 5),
        
            reviewDate.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            reviewDate.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            
            reviewComment.topAnchor.constraint(equalTo: reviewerName.bottomAnchor, constant: 10),
            reviewComment.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            reviewComment.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            reviewComment.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
}
