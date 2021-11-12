import Foundation
import SwiftUI

struct Product: Decodable,Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    var category: Category
    let imageUrl: String
    let rating: Rating
    var isFavorite: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case imageUrl = "image"
        case rating = "rating"
    }

    enum Category: String, Codable, CaseIterable {
        case electronics = "electronics"
        case jewelery = "jewelery"
        case menSClothing = "men's clothing"
        case womenSClothing = "women's clothing"
    }
    
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }

}










