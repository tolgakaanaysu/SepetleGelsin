import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    var onAction: () -> Void

    var body: some View {
        Button(action: {
            onAction()
        }){
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor( isFavorite ? .red: .gray)
        }
    }
}


