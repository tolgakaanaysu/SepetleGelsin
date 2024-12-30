//
//  SearchVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 30.12.2024.
//

import Combine
import SwiftUI

final class SearchViewModel: ObservableObject {
    @Published var searchText: String = "" // Kullanıcı arama metni
    @Published var filteredProducts: [ProductModel] = [] // Filtrelenmiş ürünler

    private var cancellables: Set<AnyCancellable> = []

    func bind(productList: Published<[ProductModel]>.Publisher) {
        $searchText
            .combineLatest(productList) // productList'ten veriyi al
            .debounce(for: .milliseconds(100), scheduler: RunLoop.main) // Kullanıcı yazmayı durdurana kadar bekle
            .sink { [weak self] searchText, productList in
                self?.filteredProducts = productList.filter {
                    !searchText.isEmpty && $0.title
                        .lowercased()
                        .contains(searchText.lowercased())
                }
            }
            .store(in: &cancellables)
    }
}
