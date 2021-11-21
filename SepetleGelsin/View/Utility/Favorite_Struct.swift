import Foundation
import SwiftUI

protocol Favorite {
    
}

extension Favorite {
    func isFavorite(productDetailsItem: ProductModel,viewModel: ProductViewModel ) -> Bool {
        for element in viewModel.favoriteList {
            if element.id == productDetailsItem.id {
                return true
            }
        }
        return false
    }
}

extension Favorite {
    func addFavorite(productDetailsItem: ProductModel, viewModel: ProductViewModel) {
        viewModel.favoriteList.append(productDetailsItem)

    }
}

extension Favorite {
    func removeFavorite(productDetailsItem: ProductModel, viewModel: ProductViewModel) {
        viewModel.favoriteList.remove(object: productDetailsItem)
    }
}


extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }

}

