//
//  ProductDataModel.swift
//  Recipe book
//
//  Created by Shivam Kumar on 11/10/24.
//

import Foundation
struct GroceryDataModel: Codable {
    
    let products: [GroceryModel]
    let total: Int
    let skip: Int
    let limit: Int
}

struct GroceryModel: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let tags: [String]?
    let brand: String?
    let sku: String?
    let weight: Double?
    let images: [String]
    let thumbnail: String
    let reviews: [Review]?
    let returnPolicy: String?
    let warrantyInformation : String?
    let shippingInformation: String?
    let availability: String?
    let minimumOrderQuantity: Int?
    let meta: Meta

    struct Review: Codable {
        let rating: Int
        let comment: String
        let date: String?
        let reviewerName: String
        let reviewerEmail: String
    }

    struct Meta: Codable {
        let createdAt: String
        let updatedAt: String
        let barcode: String
        let qrCode: String
    }
}
