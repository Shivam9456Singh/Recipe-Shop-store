//
//  DiningViewController.swift
//  Recipe book
//
//  Created by Shivam Kumar on 06/10/24.
//

import Foundation
import UIKit

class GroceryViewController : UIViewController {
    
    let groceryView = GroceryView()
    let apiCaller = APICaller()
    
    private var productData : [GroceryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        callData()
    }
    
    func callData(){
        if productData.isEmpty {
            apiCaller.fetchProducts{ (productData) in
                self.productData = productData
                DispatchQueue.main.async{
                    self.groceryView.collectionView.reloadData()
                }
            }
            
        }
    }
    
    func setupView(){
        groceryView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groceryView)
        
        NSLayoutConstraint.activate([
            groceryView.topAnchor.constraint(equalTo: view.topAnchor),
            groceryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            groceryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groceryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        let shoppingCartImage = UIImage(systemName: "cart.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        
        let cartButton = UIBarButtonItem(image: shoppingCartImage, style: .plain, target: self, action: #selector(openCart))
        
        navigationItem.titleView = groceryView.searchBar
        navigationItem.rightBarButtonItem = cartButton
        groceryView.searchBar.delegate = self
        groceryView.collectionView.delegate = self
        groceryView.collectionView.dataSource = self
        groceryView.collectionView.register(FirstTypeCell.self, forCellWithReuseIdentifier: "ProductCell")
        groceryView.collectionView.showsVerticalScrollIndicator = false
        groceryView.collectionView.register(GroceryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: GroceryHeaderView.identifier)
        
    }
    
    @objc func openCart(_sender : AnyObject){
        
    }
}


//MARK: - SearchBar Delegate

extension GroceryViewController : UISearchBarDelegate {
    
}

//MARK: - CollectionView Delegate and DataSource

let imageCache = NSCache<NSString,UIImage>()

extension GroceryViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    
    func sendData(viewModel: GroceryModel) {
        let detailVC = DetailGroceryViewController()
        detailVC.configure(with: viewModel)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? FirstTypeCell else{return UICollectionViewCell()}
        let product = productData[indexPath.row]
        
        cell.configureCell(title: product.title, image: product.thumbnail, summary: product.description, indexPath: indexPath, productPrice: product.price ?? 0.0 ,imageCache: imageCache)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 80, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else{return UICollectionReusableView()}
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryHeaderView.identifier, for: indexPath) as? GroceryHeaderView else {return UICollectionReusableView()}
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = productData[indexPath.row]
        let detailVC = DetailGroceryViewController()
        detailVC.configure(with: selectedProduct)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}



