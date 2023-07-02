//
//  OrdersList.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 15.01.2022.
//

import SwiftUI

struct OrdersList: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    @EnvironmentObject var ordersViewModel: OrdersViewModel
    
    
    var body: some View {
        
        NavigationView{
            
            List {
                ForEach(ordersViewModel.categorizeDate.keys.sorted().reversed(), id:\.self){ product in

                        OrdersGroup(orderDate: product, orderArray: ordersViewModel.categorizeDate[product]!)
                    }
            }
            .padding(.top,20)
            .navigationTitle("Siparişim")
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
           
        }
        .onAppear {
            ordersViewModel.fetchData()
    
        }
        
    }
    
}



struct OrdersList_Previews: PreviewProvider {
    static var previews: some View {
        OrdersList()
           
    }
}

