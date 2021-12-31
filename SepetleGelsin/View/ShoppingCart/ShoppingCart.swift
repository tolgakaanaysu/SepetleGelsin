import SwiftUI

struct ShoppingCart: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center ) {
                
                Group {
                    ForEach(viewModel.shoppingCartList){ product in
                            ShoppingCartRow(product: product)
                            
                    }
                    .navigationTitle("Sepetim")
                    .listStyle(.inset)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem{
                            ClearCartButton()
                        }
                    }
                    Spacer()
                    
                    
                    Text("\(viewModel.calculateTotalPrice())")
                        .padding(.bottom, 20)
                        
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
