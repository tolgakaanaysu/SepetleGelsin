import SwiftUI

struct ClearCartButton: View {
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: ShoppingCartVM
    
    var body: some View {
        Button (action: {
            showingAlert.toggle()
        }){
            Image(systemName: "trash.fill")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UYARI"),
                  message: Text("Sepeti boşaltmak ister misiniz"),
                  primaryButton: .destructive(Text("Evet")){
                viewModel.clearCart()
            },
                  secondaryButton: .cancel(Text("İptal")) )
        }
    }
}

struct ClearCart_Previews: PreviewProvider {
    static var previews: some View {
        ClearCartButton()
    }
}
