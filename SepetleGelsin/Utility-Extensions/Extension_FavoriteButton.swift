import Foundation

extension FavoriteButton {
    //Check product is favorite
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
    //Add  product
    func addFavorite(){
        self.viewModel.favoriteList.append(self.productDetailsItem)
    }
}

extension FavoriteButton {
    //Remove product
    func removeFavorite() {
        self.viewModel.favoriteList.remove(object: self.productDetailsItem)
    }
}





