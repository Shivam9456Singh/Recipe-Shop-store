//
//  DishDetailView.swift
//  Recipe book
//
//  Created by Shivam Kumar on 15/10/24.
//

import Foundation
import UIKit

class DishDetailView : UIView {
    
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
    
    let dishImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
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
    
    let dishTitleLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let mealTypeLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let ratingsLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let categoryLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let calorieperServingLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "calorieperServing "
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        return label
    }()
    
    let allTagsLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let difficultyLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let cookTimeLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let prepareInTimeLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let servingsLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let ingredientsLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ingredients Table:"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    let ingredientsTableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let instructionLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How to make:"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    let instructionsTableView : UITableView = {
        let tableView = UITableView()
         tableView.translatesAutoresizingMaskIntoConstraints = false
          
         return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(dishImageView)
        containerView.addSubview(dishTitleLabel)
        containerView.addSubview(ratingsLabel)
        containerView.addSubview(categoryLabel)
        containerView.addSubview(calorieperServingLabel)
        containerView.addSubview(allTagsLabel)
        containerView.addSubview(difficultyLabel)
        containerView.addSubview(cookTimeLabel)
        containerView.addSubview(prepareInTimeLabel)
        containerView.addSubview(servingsLabel)
        containerView.addSubview(mealTypeLabel)
        containerView.addSubview(saveButton)
        containerView.addSubview(ingredientsLabel)
        containerView.addSubview(ingredientsTableView)
        containerView.addSubview(instructionLabel)
        containerView.addSubview(instructionsTableView)
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
            
            
            dishImageView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20),
            dishImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            dishImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            dishImageView.heightAnchor.constraint(equalToConstant: 300),
            
            
            saveButton.topAnchor.constraint(equalTo: dishImageView.bottomAnchor),
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            
            
            dishTitleLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 20),
            dishTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            dishTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            

            calorieperServingLabel.topAnchor.constraint(equalTo: dishTitleLabel.bottomAnchor, constant: 20),
            calorieperServingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            calorieperServingLabel.widthAnchor.constraint(equalToConstant: 150),
            calorieperServingLabel.heightAnchor.constraint(equalToConstant: 30),
            
            allTagsLabel.topAnchor.constraint(equalTo: dishTitleLabel.bottomAnchor, constant: 20),
            allTagsLabel.leadingAnchor.constraint(equalTo: calorieperServingLabel.trailingAnchor, constant: 10),
            allTagsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
           
            ratingsLabel.topAnchor.constraint(equalTo: calorieperServingLabel.bottomAnchor, constant: 20),
            ratingsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            

            categoryLabel.topAnchor.constraint(equalTo: calorieperServingLabel.bottomAnchor, constant: 20),
            categoryLabel.leadingAnchor.constraint(equalTo: ratingsLabel.trailingAnchor, constant: 20),
            

            mealTypeLabel.topAnchor.constraint(equalTo: ratingsLabel.bottomAnchor, constant: 20),
            mealTypeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            servingsLabel.topAnchor.constraint(equalTo: calorieperServingLabel.bottomAnchor, constant: 20),
            servingsLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 20),


            difficultyLabel.topAnchor.constraint(equalTo: servingsLabel.bottomAnchor, constant: 20),
            difficultyLabel.leadingAnchor.constraint(equalTo: mealTypeLabel.trailingAnchor, constant: 20),
            
            cookTimeLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 20),
            cookTimeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            prepareInTimeLabel.topAnchor.constraint(equalTo: mealTypeLabel.bottomAnchor, constant: 20),
            prepareInTimeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            ingredientsLabel.topAnchor.constraint(equalTo: prepareInTimeLabel.bottomAnchor, constant: 30),
            ingredientsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            ingredientsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            ingredientsTableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 10),
            ingredientsTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            ingredientsTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            ingredientsTableView.heightAnchor.constraint(equalToConstant: 200),
            
            instructionLabel.topAnchor.constraint(equalTo: ingredientsTableView.bottomAnchor, constant: 30),
            instructionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            instructionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            instructionsTableView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor,constant: 10),
            instructionsTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            instructionsTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            instructionsTableView.heightAnchor.constraint(equalToConstant: 200),
            instructionsTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
        ])
    }
}
