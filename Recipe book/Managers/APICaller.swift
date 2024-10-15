//
//  APICaller.swift
//  Recipe book
//
//  Created by Shivam Kumar on 11/10/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.spoonacular.com/"
    static let SpoonacularAPIKey = "315d50be3a5b4dae829558ff707920db"
}

class APICaller : Codable {
    
    func fetchProducts(completionHandler : @escaping([GroceryModel])->Void){
        guard let url = URL(string : "https://dummyjson.com/products?limit=194") else {return}
      
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response , error) in
        
            if let error = error {
                print("error occured fetching data : \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response status code : \(String(describing: response))")
                return
            }
            
            if let safeData = data {
                if  String(data: safeData, encoding: .utf8) != nil {

                }
                do{
                    let productData = try JSONDecoder().decode(GroceryDataModel.self, from: safeData)
                    completionHandler(productData.products)
                } catch {
                    print("Error in decoding data")
                }
                
            }
            
        })
        
        task.resume()
    }
    
    func fetchSpoonacularAPIData(completionHandler : @escaping([SpoonacularRecipes])->Void){
        let urlString = "\(Constant.baseURL)/recipes/random?apiKey=\(Constant.SpoonacularAPIKey)&number=50"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error ) in
        
            if let error = error {
                print("Error in fetching data : \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Server Error : \(String(describing: response))")
                return
            }
            
            if let safeData = data {
                if String(data: safeData, encoding: .utf8) != nil {
                    print(safeData)
                }
                do{
                    let spoonacularData = try JSONDecoder().decode(SpoonacularDiningModel.self, from: safeData)
                    completionHandler(spoonacularData.spoonacularRecipes)
                }catch {
                    print("Error in decoding spoonacular data")
                }
            }
            
        })
        
        task.resume()
    }
    
    func fetchRecipesFromDummyJSON(completionHandler : @escaping([Recipes])->Void){
        guard let url = URL(string : "https://dummyjson.com/recipes?limit=50") else {return}
      
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response , error) in
        
            if let error = error {
                print("error occured fetching data : \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response status code : \(String(describing: response))")
                return
            }
            
            if let safeData = data {
                if  String(data: safeData, encoding: .utf8) != nil {
                    
                }
                do{
                    let productData = try JSONDecoder().decode(DiningModel.self, from: safeData)
                    completionHandler(productData.recipes)
                } catch {
                    print("Error in decoding data")
                }
                
            }
            
        })
        
        task.resume()
    }
    
    
}

