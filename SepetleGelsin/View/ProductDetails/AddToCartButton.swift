//
//  AddToCartButton.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 31.12.2021.
//

import SwiftUI

struct AddToCartButton: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @State var productQuantity = 0
    @State var isContain = false
    var product: ProductModel
        
    var body: some View {
        // 1: check quantity of products in cart
        // 2: check if Cart is empty
        // 3: check if product is in Cart
        
        Button{
            productQuantity = viewModel.productQuantityDict[product.id] ?? 0
            
            if !viewModel.shoppingCartList.isEmpty {
                viewModel.shoppingCartList.forEach { listItem in
                    if product.id == listItem.id  {
                        isContain = true
                    }
                     
                }
                if !isContain {
                    viewModel.shoppingCartList.append(product)
                }
                
            } else {
                viewModel.shoppingCartList.append(product)
            }
            productQuantity+=1
            viewModel.productQuantityDict[product.id] = productQuantity
            
        } label: {
            Text("Sepete Ekle")            
                .font(.title2 )
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,18)
                .frame(width: getScreen().width * 0.4,
                        height: getScreen().height * 0.075,
                        alignment: .center)
                .background(Color.ourApplicationColor)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.15),
                            radius: 5, x:10 , y: 5)
            }
            
        
        
        
        
        
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(product: ProductViewModel().productList[1])
    }
}
