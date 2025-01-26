import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var viewModel: ShoppingCartVM

    var body: some View {
        NavigationView {
            Group {
                if viewModel.shoppingCartList.isEmpty {
                    EmptyInfoView(
                        imageName: "cart.fill.badge.minus",
                        message: "Sepetiniz şu anda boş"
                    )
                    .padding(.top, 20)
                } else {
                    ScrollView {
                        ForEach(Array(viewModel.shoppingCartList), id: \.key) { product, quantity in
                            ShoppingCartRow(product: product, quantity: quantity)
                        }
                        .padding(.top, 20)
                    }
                }
            }
            .navigationTitle("Sepetim")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Text(String(format: "%.2f ₺", viewModel.totalPrice))
                        .frame(width: 75, height: 35)
                        .clipShape(Capsule())
                        .opacity(0.8)
                        .foregroundColor(.black)

                    NavigationLink {
                        PaymentView()
                    } label: {
                        Image(systemName: "creditcard")
                    }
                    TrashButton(alertMessage: "Sepeti boşaltmak ister misiniz?") {
                        viewModel.clearCart()
                    }
                }
            }
        }
    }
}
