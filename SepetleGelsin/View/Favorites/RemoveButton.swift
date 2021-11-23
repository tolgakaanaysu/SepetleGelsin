import SwiftUI

struct RemoveButton: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        Button (action: {
            removeAllFavorites()
        }){
            Image(systemName: "trash")
        }

    }
}

struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoveButton()
    }
}
