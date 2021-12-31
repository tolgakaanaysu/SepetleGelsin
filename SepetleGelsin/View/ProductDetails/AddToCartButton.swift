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
    
    var productID: Int
    var body: some View {
        Button{
            viewModel.shoppingCartList[productID] = productQuantity
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
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.15),
                        radius: 5, x:10 , y: 5)
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(productID: 5)
    }
}
