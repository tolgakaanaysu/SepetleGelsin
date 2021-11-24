import Foundation


extension RemoveButton {
    func removeAllFavorites(){
        self.viewModel.favoriteList.removeAll()
    }
}
