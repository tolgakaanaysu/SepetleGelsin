//
//  OrdersList.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 15.01.2022.
//

import SwiftUI


struct OrdersList: View {
    @EnvironmentObject var viewModel: ProductViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                
                    ForEach(viewModel.shoppingCartList){ product in
                        Divider()
                        OrdersListRow(product: product)
                    }
            }
            .padding(.top,20)
            .navigationTitle("Siparişim")
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing ){
                    Text(viewModel.calculateTotalPrice())
                        
                        .frame(width: 75, height: 35)
                        .background(Color.secondary)
                        .clipShape(Capsule())
                        .opacity(0.7)
                        .foregroundColor(.black)
                        
                }
            }
        }
    }
}

struct OrdersList_Previews: PreviewProvider {
    static var previews: some View {
        OrdersList()
            .environmentObject(ProductViewModel())
    }
}
