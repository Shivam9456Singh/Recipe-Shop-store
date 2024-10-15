//
//  DishDetailViewController.swift
//  Recipe book
//
//  Created by Shivam Kumar on 15/10/24.
//

import Foundation
import UIKit

class DishDetailViewController : UIViewController {
    
    let dishDetailView = DishDetailView()
    var recipeData : Recipes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishDetailView.ingredientsTableView.dataSource = self
        dishDetailView.ingredientsTableView.delegate = self
        dishDetailView.instructionsTableView.dataSource = self
        dishDetailView.instructionsTableView.dataSource = self
        
        dishDetailView.instructionsTableView.register(IngredientsInstructionCell.self, forCellReuseIdentifier: "instructCell")
        dishDetailView.ingredientsTableView.register(IngredientsInstructionCell.self, forCellReuseIdentifier: "ingredientsCell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(dishDetailView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dishDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dishDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            dishDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dishDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dishDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func configure(with viewModel : Recipes){
        recipeData = viewModel
        dishDetailView.dishTitleLabel.text = viewModel.name
        
        let cacheKey = NSString(string: viewModel.image ?? "Nil")
        
        if let cahcedImage = imageCache.object(forKey: cacheKey){
            self.dishDetailView.dishImageView.image = cahcedImage
        }
        else{
            DispatchQueue.global(qos: .background).async {[weak self] in
                guard let self = self else { return }
                guard let url = URL(string: viewModel.image ?? "nil"), let data = try? Data(contentsOf: url),
                      let downloadedImage = UIImage(data: data) else {return}
                imageCache.setObject(downloadedImage, forKey: cacheKey)
                DispatchQueue.main.async{
                    self.dishDetailView.dishImageView.image = downloadedImage
                }
            }
        }
        
        let titleFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let valueFont = UIFont.systemFont(ofSize: 16, weight: .thin)
        
        dishDetailView.categoryLabel.attributedText = createAttributedText(title: "Cuisine", value: viewModel.cuisine ?? "Unknown", titleFont: titleFont, valueFont: valueFont)
        
        
        dishDetailView.ratingsLabel.attributedText = createAttributedText(title: "Rating", value: "\(viewModel.rating ?? 0.0) ⭐️" , titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.mealTypeLabel.attributedText = createAttributedText(title: "Meal type", value: "\(viewModel.mealType?[0] ?? "Unknown" ) 🍽️" , titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.calorieperServingLabel.attributedText = createAttributedText(title: "Calories", value: "\(viewModel.caloriesPerServing ?? 0) cal", titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.prepareInTimeLabel.attributedText = createAttributedText(title: "Preparation time", value: "\(viewModel.prepTimeMinutes ?? 0) min.", titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.cookTimeLabel.attributedText = createAttributedText(title: "Cooking Time", value: "\(viewModel.cookTimeMinutes ?? 0) min.", titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.servingsLabel.attributedText = createAttributedText(title: "Serving", value: "\(viewModel.servings ?? 0) 👤", titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.difficultyLabel.attributedText = createAttributedText(title: "Difficulty", value: viewModel.difficulty ?? "Unknown", titleFont: titleFont, valueFont: valueFont)
        
        dishDetailView.allTagsLabel.attributedText = createAttributedText(title: "Tags", value: viewModel.tags?.joined(separator: ", ") ?? "Unknown", titleFont: titleFont, valueFont: valueFont)
        
    }
    
    private func createAttributedText(title : String , value : String, titleFont : UIFont, valueFont : UIFont)->NSAttributedString {
        let attributedString = NSMutableAttributedString(
            string : "\(title): ",
            attributes : [NSAttributedString.Key.font : titleFont]
        )
        let valueString  = NSAttributedString(
            string : value,
            attributes : [NSAttributedString.Key.font : valueFont]
        )
        attributedString.append(valueString)
        return attributedString
    }
    
}

extension DishDetailViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == dishDetailView.ingredientsTableView {
            return recipeData?.ingredients?.count ?? 0
        }
        else{
            return recipeData?.instructions?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == dishDetailView.ingredientsTableView {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath) as? IngredientsInstructionCell else {return UITableViewCell()}
            cell.cellLabel.text = "\(recipeData?.ingredients?[indexPath.row] ?? "Not Available")"
            cell.selectionStyle = .none
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "instructCell", for: indexPath) as? IngredientsInstructionCell else {return UITableViewCell()}
             cell.cellLabel.text = "\(recipeData?.instructions?[indexPath.row] ?? "Not Available")"
             cell.selectionStyle = .none
             return cell
        }
    }
    
    
}
