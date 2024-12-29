//
//  HomepageVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 30.12.2024.
//

import Foundation

final class HomepageVM: ObservableObject {
    @Published var productList: [ProductModel] = DataService().loadData("data.json")

    var categories: [String: [ProductModel]] {
        Dictionary(
            grouping: productList,
            by: { $0.category.rawValue }
        )
    }
}
