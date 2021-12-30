import SwiftUI

struct ShoppingCartRow: View {
    @State private var count = 0
    var product: ProductModel
    
    var body: some View {
        HStack {
            product.image
                .resizable()
                .frame(width: 100, height: 100)
            
            VStack {
                
                Text(product.title)
                    .padding(.bottom)
                
                Text("\(product.price) ₺")
                
            }
            
            Spacer()
            
            Stepper {
                Text("\(count)")
            } onIncrement: {
                count+=1
            } onDecrement: {
                count-=1
            }

            

            
        }.padding()
    }
}

struct ShoppingCartRow_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartRow(product: ProductViewModel().productList[3])
    }
}
