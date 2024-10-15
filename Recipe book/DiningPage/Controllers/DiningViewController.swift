//
//  diningViewControllers.swift
//  Recipe book
//
//  Created by Shivam Kumar on 06/10/24.
//

import Foundation
import UIKit

class DiningViewController : UIViewController {
    
    let diningView = DiningView()
    let headerView = TableHeaderView()
    let apiCaller = APICaller()
    
    
    private var recipeData : [Recipes] = []
    private var spoonacularRecipeData : [SpoonacularRecipes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.frame = CGRect(x: 0, y: 0, width: diningView.tableView.frame.width, height: 200)
        diningView.tableView.tableHeaderView = headerView
        navigationItem.titleView = diningView.searchBar
        setupView()
        fetchDummyJSON()
        fetchSpoonacularJSON()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.removeFromSuperview()
    }
    
    
    func setupView(){
        diningView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(diningView)
        
        NSLayoutConstraint.activate([
            diningView.topAnchor.constraint(equalTo: view.topAnchor),
            diningView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            diningView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            diningView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        diningView.searchBar.delegate = self
        diningView.tableView.dataSource = self
        diningView.tableView.delegate = self
        diningView.tableView.register(FirstTypeTableCell.self, forCellReuseIdentifier: "FirstTableCell")
        diningView.tableView.register(SecondTypeTableCell.self, forCellReuseIdentifier: "SecondTableCell")
        diningView.tableView.register(ThirdTypeTableViewCell.self, forCellReuseIdentifier: "ThirdTableCell")
        diningView.tableView.register(TitleTableCell.self, forCellReuseIdentifier: "TitleTableCell")
        diningView.tableView.rowHeight = UITableView.automaticDimension
        diningView.tableView.estimatedRowHeight = UITableView.automaticDimension
        diningView.tableView.separatorStyle = .none
    }
    
    func fetchSpoonacularJSON(){
        if spoonacularRecipeData.isEmpty {
            apiCaller.fetchSpoonacularAPIData{ (spoonacularRecipeData) in
                self.spoonacularRecipeData = spoonacularRecipeData
                print(" fetched spoonacular data : \(spoonacularRecipeData.count)")
            }
        }
    }
    
    func fetchDummyJSON(){
        if recipeData.isEmpty {
            apiCaller.fetchRecipesFromDummyJSON{ (recipeData) in
                self.recipeData = recipeData
                DispatchQueue.main.async{
                    self.diningView.tableView.reloadData()
                }
            }
        }
    }
    
}


extension DiningViewController : UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
}

//MARK: - Table View Delegate DataSource

extension DiningViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 + recipeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch index {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableCell") as? TitleTableCell else {return UITableViewCell()}
            cell.titleLabel.text = "MOST VIEWED"
            cell.titleLabel.textAlignment = .justified
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableCell") as? FirstTypeTableCell else { return UITableViewCell()}
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableCell") as? TitleTableCell else { return UITableViewCell()}
            cell.titleLabel.text = " FAVOURITE"
            cell.titleLabel.textAlignment = .left
            cell.selectionStyle = .none
            return cell
        case 3...(2+(recipeData.isEmpty ? 0 : recipeData.count)):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableCell") as? SecondTypeTableCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            let recipeIndex = indexPath.row - 3
            let recipeInfo = recipeData[recipeIndex]
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.layer.shadowRadius = 5
            cell.layer.shadowOpacity = 0.5
            cell.backgroundColor = .clear
           
            cell.setData(recipeInfo.name ?? "Unknown", recipeInfo.cuisine ?? "Unknown" , recipeInfo.image ?? "nil", recipeInfo.servings ?? 0, recipeInfo.cookTimeMinutes ?? 0, recipeInfo.caloriesPerServing ?? 0, recipeInfo.rating ?? 0 )
            return cell
        case  (1+recipeData.count):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableCell") as? TitleTableCell else {return UITableViewCell()}
            cell.titleLabel.text = "ONLY FOR YOU"
            cell.titleLabel.textAlignment = .center
            cell.selectionStyle = .none
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableCell") as? ThirdTypeTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dishDetailVC = DishDetailViewController()
        let dishDataModel = recipeData[indexPath.row-3]
        dishDetailVC.configure(with : dishDataModel)
        navigationController?.pushViewController(dishDetailVC, animated: true)
    }
    
    
}
