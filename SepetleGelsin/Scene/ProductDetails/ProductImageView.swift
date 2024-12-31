import SwiftUI

struct ProductImageView: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(width: screenBounds.width * 0.5,
                   height: screenBounds.width * 0.5)
            .shadow(color: .applicationColor , radius: 5)
            .padding()
    }
}

#if DEBUG
struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView(image: HomepageVM().productList[1].image )
    }
}
#endif
