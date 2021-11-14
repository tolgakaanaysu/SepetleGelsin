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

let A = Product(id: 100, title: "Title", price: 10.2, description: "Description", category: .jewelery, imageUrl: "https://www.cumhuriyet.com.tr/Archive/2021/7/31/1856842/kapak_145858.jpeg", rating: .init(rate: 2.3, count: 25))

let B = Product(id: 10, title: "Title2", price: 102.22, description: "Description2", category: .electronics, imageUrl: "https://pbs.twimg.com/media/E7nzAxBWQAAgfMj?format=jpg&name=large", rating: .init(rate: 3.3, count: 45))

let AB = [A,B]








