//
//  OrdersListRow.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 15.01.2022.
//

import SwiftUI

struct OrdersListRow: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @State var quantity = 1
    var product: ProductModel

    var body: some View {
        HStack {
            
            product.image
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(10)
                .shadow(color: .ourApplicationColor , radius: 3)
                .padding()
            
            Spacer()
            
            HStack{
            Text(product.title)
                .frame(width: 80, height: 50, alignment: .center)
            Spacer()
                //Quantity Text
            Text(String(quantity))
                    .bold()
                    .font(.callout)
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(Color.secondary)
                    .cornerRadius(15)
                    .opacity(0.7)
            Spacer()
            Text(String(format: "%.2f ₺",
            product.price * Double(quantity) ))
                    .bold()
                    .frame(width: 80, height: 50, alignment: .center)
                
            }.padding()
        }
    }
}


struct OrdersListRow_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListRow(product: ProductViewModel().productList[5])
    }
}
