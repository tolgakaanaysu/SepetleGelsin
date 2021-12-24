import SwiftUI

struct RemoveButton: View {
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        Button (action: {
            showingAlert.toggle()
        }){
            Image(systemName: "trash")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UYARI"),
                  message: Text("Tüm Favoriler Silinecek"),
                  primaryButton: .destructive(Text("SİL")){
                self.viewModel.favoriteList.removeAll()
            },
                  secondaryButton: .cancel() )
        }

    }
}

struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoveButton()
    }
}
