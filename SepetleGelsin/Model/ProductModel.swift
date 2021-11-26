import Foundation
import SwiftUI

struct ProductModel: Decodable,Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let rating: Rating
    private let imageName: String
   
    var image: Image {
        Image(imageName)
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
    
  
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case imageName = "image"
        case rating = "rating"
    }
}
