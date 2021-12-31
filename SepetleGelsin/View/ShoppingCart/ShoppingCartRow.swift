import SwiftUI

struct ShoppingCartRow: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @State var quantity = 0
    var product: ProductModel

    var body: some View {
        HStack {
            
            product.image
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(10)
                .shadow(color: .ourApplicationColor , radius: 3)
                
           Spacer()
            
            HStack{
                
                //Minus button
                Button {
                    quantity = viewModel.productQuantityDict[product.id] ?? 0
                    if quantity > 1 {
                        quantity-=1
                    }
                    else {
                        if let index = viewModel.shoppingCartList.firstIndex(where: {$0.id == product.id }) {
                            viewModel.shoppingCartList.remove(at: index)
                        }
                    }
                    viewModel.productQuantityDict[product.id] = quantity
                } label: {
                    Image(systemName: "minus")
                        .font(.callout)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.ourApplicationColor)
                        .cornerRadius(10)
                        .opacity(0.8)
                        
                    
                }

                
                //count
                Text(String(viewModel.productQuantityDict[product.id] ?? 0))
                    .bold()
                    .font(.callout)
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(Color.secondary)
                    .cornerRadius(10)
                    .opacity(0.7)
                
                //plus button
                Button {
                    quantity = viewModel.productQuantityDict[product.id] ?? 0
                    quantity+=1
                    viewModel.productQuantityDict[product.id] = quantity

                } label: {
                    Image(systemName: "plus")
                        .font(.callout)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.ourApplicationColor)
                        .cornerRadius(10)
                        .opacity(0.8)
                }

                
                
            }
            
           

            

            
        }
        
        .padding()
    }
}

struct ShoppingCartRow_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartRow(product: ProductViewModel().productList[3])
    }
}
