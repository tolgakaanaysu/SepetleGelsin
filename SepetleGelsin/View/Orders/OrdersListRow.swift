//
//  OrdersListRow.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 15.01.2022.
//




import SwiftUI

struct OrdersListRow: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @EnvironmentObject var ordersViewModel: OrdersViewModel
    
    var product: ProductModel {
        for i in viewModel.productList {
            if i.id == orderProduct.productId {
                return i
            }
        }
        return viewModel.productList.last!
        
    }
    var orderProduct: pastOrders

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
                Text(String(orderProduct.quaintity))
                    .bold()
                    .font(.callout)
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(Color.secondary)
                    .cornerRadius(15)
                    .opacity(0.7)
            Spacer()
            Text(String(format: "%.2f ₺",
                        product.price * Double(orderProduct.quaintity)))
                    .bold()
                    .frame(width: 80, height: 50, alignment: .center)
                
            }.padding()
        }
    }
}



