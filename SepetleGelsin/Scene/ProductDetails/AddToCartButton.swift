//
//  AddToCartButton.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 31.12.2021.
//

import SwiftUI

struct AddToCartButton: View {
    @EnvironmentObject var viewModel: ShoppingCartVM
    
    @State var isContain = false
    var product: ProductModel
        
    var body: some View {
        Button{
            viewModel.appendProduct(product)
        } label: {
            Text("Sepete Ekle")            
                .font(.title2 )
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,18)
                .frame(width: screenBounds.width * 0.4,
                        height: screenBounds.height * 0.06,
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
        AddToCartButton(product: HomepageVM().productList[1])
    }
}
