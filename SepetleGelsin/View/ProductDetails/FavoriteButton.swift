import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var favoriteVM: FavoriteVM
    var productDetailsItem: ProductModel
  
    //Check if product is favorite...
    func isFavorite() -> Bool {
        for element in favoriteVM.favoriteList {
            if element.id == self.productDetailsItem.id {
                return true
            }
        }
        return false
    }
    
    var body: some View {
        Button(action: {
            if !isFavorite(){
                favoriteVM.favoriteList.append(productDetailsItem)
            } else {
                if let index = favoriteVM.favoriteList.firstIndex(where: {$0.id == productDetailsItem.id }) {
                    favoriteVM.favoriteList.remove(at: index)
                }
            }
            print("buttonCount")
            print(favoriteVM.favoriteList.count)
        }){
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor( isFavorite() ? Color.red: Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(productDetailsItem: HomepageVM().allProductList[1])
            .environmentObject(FavoriteVM())
    }
}
 


