import SwiftUI

struct ProductDetails: View {
    @EnvironmentObject var viewModel: FavoriteListVM
    var productDetailsItem: ProductModel
    var body: some View {
        VStack {
            ProductImage(image: productDetailsItem.image)
            HStack {
                Text(String(format:"%.2f",productDetailsItem.price) + "₺")
                    .frame(width: 100, height: 20,
                           alignment: .center)
                    .font(.body)
                Spacer()
                FavoriteButton(
                    isFavorite: viewModel.checkFavorite(productDetailsItem))
                {
                    viewModel.toggleFavorite(productDetailsItem)
                }
            }
            .padding()
            .frame(width: screenBounds.width, height: 75)
            Divider()
            Text(productDetailsItem.description)
            Spacer()
            AddToCartButton(product: productDetailsItem)
        }
        .padding()
        .environmentObject(viewModel)
    }
}
