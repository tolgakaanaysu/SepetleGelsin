import SwiftUI

struct ShoppingCart: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                    ForEach(viewModel.shoppingCartList){ product in
                        Divider()
                        ShoppingCartRow(product: product)
                    }
            }
            .padding(.top,20)
            .navigationTitle("Sepetim")
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing ){
                    Text(String("\(viewModel.calculateTotalPrice()) ₺"))
                        
                        .frame(width: 75, height: 35)
                        .clipShape(Capsule())
                        .opacity(0.8)
                        .foregroundColor(.black)
                        
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink {
                        PayWall()
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

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
            .environmentObject(ProductViewModel())
    }
}
