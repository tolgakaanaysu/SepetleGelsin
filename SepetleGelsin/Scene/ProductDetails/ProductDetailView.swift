import SwiftUI

struct ProductDetailView: View {
    // MARK: - Property
    @EnvironmentObject private var viewModel: FavoriteListVM
    @EnvironmentObject private var shoppingCartVM: ShoppingCartVM
    var productDetailsItem: ProductModel

    // MARK: - Body

    var body: some View {
        VStack {
            ProductImageView(image: productDetailsItem.image)
            HStack {
                priceTextView
                Spacer()
                favoriteButtonView
            }
            .padding()
            .frame(width: screenBounds.width, height: 75)
            Divider()
            productDescriptionView
            Spacer()
            AddToCartButton() {
                shoppingCartVM.appendProduct(productDetailsItem)
            }
        }
        .padding()
    }
}

// MARK: - View

private extension ProductDetailView {

    var priceTextView: some View {
        Text(String(format:"%.2f",productDetailsItem.price) + "₺")
            .frame(width: 100, height: 20, alignment: .center)
            .font(.body)
    }

    var favoriteButtonView: some View {
        FavoriteButtonView(
            isFavorite: viewModel.checkFavorite(productDetailsItem))
        {
            viewModel.toggleFavorite(productDetailsItem)
        }
    }

    var productDescriptionView: some View {
        Text(productDetailsItem.description)
    }
}
