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
    //Add marked product
    func addFavorite(){
        self.viewModel.favoriteList.append(self.productDetailsItem)
    }
}

extension FavoriteButton {
    //Remove marked product
    func removeFavorite() {
        self.viewModel.favoriteList.remove(object: self.productDetailsItem)
    }
}





