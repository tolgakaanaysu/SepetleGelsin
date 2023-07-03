import SwiftUI

struct FavoriteListClearButtonView: View {
    @State private var isShowAlert = false
    @EnvironmentObject private var viewModel: FavoriteVM
    
    var body: some View {
        Button (action: {
            isShowAlert = true
        }){
            Image(systemName: "trash.fill")
        }
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text("UYARI"),
                  message: Text("Tüm Favoriler Silinecek"),
                  primaryButton: .destructive(Text("SİL")){
                viewModel.clearFavoriteList()
            }, secondaryButton: .cancel())
        }
    }
}

struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListClearButtonView()
    }
}
