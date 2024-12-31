import SwiftUI

struct CategoryItemView: View {
    var product: ProductModel

    var body: some View {
        VStack(alignment: .leading) {
            productImage
            productPriceText
            productTitle
        }
        .padding(.top, 10)
    }

    private var productImage: some View {
        product.image
            .renderingMode(.original)
            .resizable()
            .frame(width: screenBounds.width * 0.25 , height: screenBounds.width * 0.25)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .applicationColor , radius: 5)
            .padding(.leading, 5)
    }

    private var productPriceText: some View {
        Text(String(format: "%.2f ₺", product.price))
            .frame(width: 110, height: 20, alignment: .center)
            .foregroundColor(.primary)
            .font(.headline)
    }
    private var productTitle: some View {
        Text(product.title)
            .frame(width: 110, height: 20, alignment: .center)
            .foregroundColor(.secondary)
            .font(.headline)
    }
}
