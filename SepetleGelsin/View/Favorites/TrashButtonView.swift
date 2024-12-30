import SwiftUI

struct TrashButtonView: View {
    @State private var showingAlert = false
    var onAction: () -> Void
    var body: some View {
        Button (action: {
            showingAlert.toggle()
        }){
            Image(systemName: "trash.fill")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UYARI"),
                  message: Text("Tüm Favoriler Silinecek"),
                  primaryButton: .destructive(Text("SİL")){
                onAction()
            },
                  secondaryButton: .cancel())
        }
    }
}

struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        TrashButtonView {
            print("Trashed")
        }
    }
}
