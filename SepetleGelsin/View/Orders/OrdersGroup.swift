//
//  OrdersGroup.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 12.02.2022.
//

import SwiftUI

struct OrdersGroup: View {
    var orderDate: String
    var orderArray : [PastOrderModel]
    var body: some View {
        
        Section {
            ForEach(orderArray) { item in
               
                OrdersListRow(orderProduct: item)
            }
            
        } header: {
            Text(orderDate)
        }
           
        
    }
}


