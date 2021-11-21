import Foundation
import SwiftUI

struct ProductModel: Decodable,Identifiable,Equatable {
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return true
    }
    
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let imageUrl: String
    let rating: Rating
   
    
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
        case imageUrl = "image"
        case rating = "rating"
    }
}


let A = ProductModel(id: 100, title: "Title", price: 10.2, description: "Description", category: .jewelery, imageUrl: "https://www.cumhuriyet.com.tr/Archive/2021/7/31/1856842/kapak_145858.jpeg", rating: .init(rate: 2.3, count: 25))
let B = ProductModel(id: 10, title: "Title2", price: 102.22, description: "Description2", category: .electronics, imageUrl: "https://cdn.webrazzi.com/uploads/2016/01/Urun-gelistirme.jpg", rating: .init(rate: 3.3, count: 45))
let AB = [A,B]








