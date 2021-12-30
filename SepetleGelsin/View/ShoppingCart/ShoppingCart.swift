import SwiftUI

struct ShoppingCart: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(1..<5){ i in
                    Text("Tolga")
                    
                }
                .navigationTitle("Sepetim")
                .listStyle(.inset)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ClearCartButton()
                }
            }
            
            
                
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
