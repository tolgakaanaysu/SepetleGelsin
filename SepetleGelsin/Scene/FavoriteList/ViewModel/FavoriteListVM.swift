//
//  FavoriteListVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 30.12.2024.
//

import Foundation

final class FavoriteListVM: ObservableObject {
    @Published var favoriteList =  [ProductModel]()
}
