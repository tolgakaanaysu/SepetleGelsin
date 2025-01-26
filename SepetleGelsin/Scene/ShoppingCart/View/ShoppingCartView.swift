import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var viewModel: ShoppingCartVM


    var body: some View {
        if viewModel.shoppingCartList.isEmpty {
            EmptyView(imageName: "cart", message: "Sepetiniz Boş")
        } else {
            NavigationView{
                ScrollView{
                    ForEach(Array(viewModel.shoppingCartList), id: \.key) { product, quantity   in
                        ShoppingCartRow(product: product, quantity: quantity)
                    }
                    .padding(.top,20)
                    .navigationTitle("Sepetim")
                    .listStyle(.inset)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing ){
                            Text(String("\(viewModel.totalPrice) ₺"))

                                .frame(width: 75, height: 35)
                                .clipShape(Capsule())
                                .opacity(0.8)
                                .foregroundColor(.black)

                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink {
                                PaymentView()
                            } label: {
                                Image(systemName: "creditcard")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            ClearCartButton()
                        }
                    }
                }
            }
        }
    }
}
struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
            .environmentObject(ShoppingCartVM())
    }
}
