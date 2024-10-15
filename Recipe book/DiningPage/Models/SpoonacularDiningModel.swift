//
//  SpoonacularDiningModel.swift
//  Recipe book
//
//  Created by Shivam Kumar on 15/10/24.
//

import Foundation
struct SpoonacularDiningModel: Codable {
    let spoonacularRecipes: [SpoonacularRecipes]
}

struct SpoonacularRecipes: Codable {
    let id: Int
    let title: String?
    let readyInMinutes: Int?
    let servings: Int?
    let sourceUrl: String?
    let image: String?
    let summary: String?
    let spoonacularScore: Double?
    let instructions: String?
//    let analyzedInstructions: [AnalyzedInstructions]?
    let vegetarian: Bool?
    let vegan: Bool?
    let glutenFree: Bool?
    let dairyFree: Bool?
    let veryHealthy: Bool?
    let cheap: Bool?
    let veryPopular: Bool?
    let dishTypes: [String]?
    let weightWatcherSmartPoints: Int?
    let aggregateLikes: Int?  // Corrected typo
    let healthScore: Int?
    let pricePerServing: Double?
}

//struct AnalyzedInstructions: Codable {
//    let name: String?
//    let steps: [Steps]?
//}
//
//struct Steps: Codable {
//    let number: Int?
//    let step: String?
//    let ingredients: [Ingredients]?
//    let equipment: [Equipment]?
//    let length: Length?  // Changed from array to single object
//}
//
//struct Ingredients: Codable {
//    let id: Int?
//    let name: String?
//    let localizedName: String?
//    let image: String?
//}
//
//struct Equipment: Codable {
//    let id: Int?
//    let name: String?
//    let localizedName: String?
//    let image: String?
//}
//
//struct Length: Codable {
//    let number: Int?
//    let unit: String?
//}
