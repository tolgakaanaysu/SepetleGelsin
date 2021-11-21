import Foundation
import SwiftUI

extension FavoriteButton {
    func isFavorite() -> Bool {
        for element in viewModel.favoriteList {
            if element.id == self.productDetailsItem.id {
                return true
            }
        }
        return false
    }
}

extension FavoriteButton {
    //Add selected product
    func addFavorite(){
        self.viewModel.favoriteList.append(self.productDetailsItem)
    }
}

extension FavoriteButton {
    //Remove selected product
    func removeFavorite() {
        self.viewModel.favoriteList.remove(object: self.productDetailsItem)
    }
}


extension Array where Element: Equatable {
 // Remove first collection element that is equal to the given `object`:
 mutating func remove(object: Element) {
     guard let index = firstIndex(of: object) else {return}
     remove(at: index)
 }

}

