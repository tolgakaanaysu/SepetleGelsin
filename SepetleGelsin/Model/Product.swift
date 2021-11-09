import Foundation

struct Product: Codable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let imageUrl: String
    let rating: Rating

  
   
}

private enum CodingKeys: String, CodingKey {
    case id = "id"
    case title = "title"
    case price = "price"
    case description = "description"
    case category = "category"
    case imageUrl = "image"
    case rating = "rating"
}


enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}


