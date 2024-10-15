//
//  DiningModel.swift
//  Recipe book
//
//  Created by Shivam Kumar on 10/10/24.
//

import Foundation

struct DiningModel : Codable {
    let recipes : [Recipes]
    let total : Int
    let limit : Int
}

struct Recipes: Codable {
    let id : Int
    let name : String?
    let ingredients : [String]?
    let instructions : [String]?
    let prepTimeMinutes : Int?
    let cookTimeMinutes : Int?
    let servings : Int?
    let difficulty : String?
    let cuisine : String?
    let caloriesPerServing : Int?
    let tags : [String]?
    let userId : Int?
    let image : String?
    let rating : Float?
    let reviewCoint : Int?
    let mealType : [String]?
}


