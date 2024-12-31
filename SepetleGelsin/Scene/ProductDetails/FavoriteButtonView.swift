import SwiftUI

struct FavoriteButtonView: View {
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

#if DEBUG
#Preview {
    FavoriteButtonView(isFavorite: false) {
        print("Favorite Button Clicked")
    }
}
#endif
