import Foundation
import SwiftUI

struct ProductModel: Decodable,Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    private let imageName: String
   
    var image: Image {
        Image(imageName)
    }

    enum Category: String, Codable, CaseIterable {
        case bakım = "Kişisel Bakım"
        case drink = "İçecekler"
        case food = "Yiyecekler"
        case clean = "Temizlik"
        case baseFood = "Temel Gıda"
        case fruitVegetable = "Meyve Sebze"
        case fastFood = "Atıştırmalıklar"
        case breakfast = "Kahvaltılıklar"
        case evBakim = "Ev Bakım"
        case baby = "Bebek"
        case pet = "Evcil Hayvan"
        case teknology = "Teknoloji"
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case imageName = "image"
    }
}
