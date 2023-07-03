//
//  FavoriteVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 3.07.2023.
//

import Foundation

final class FavoriteVM: ObservableObject {
    
    // MARK: - Properties
    @Published var favoriteList =  [ProductModel]()
}
