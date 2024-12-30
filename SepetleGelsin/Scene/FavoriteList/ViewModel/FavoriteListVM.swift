//
//  FavoriteListVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 30.12.2024.
//

import Foundation

final class FavoriteListVM: ObservableObject {
    @Published var favoriteList =  [ProductModel]()

    func checkFavorite(_ product: ProductModel) -> Bool {
        favoriteList.contains(product)
    }

    func toggleFavorite(_ product: ProductModel) {
        if checkFavorite(product) {
            removeFavorite(product)
        } else {
            addFavorite(product)
        }
    }

    private func addFavorite(_ product: ProductModel) {
        favoriteList.append(product)
    }

    private func removeFavorite(_ product: ProductModel) {
        favoriteList.removeAll(where: { $0 == product })
    }
}
