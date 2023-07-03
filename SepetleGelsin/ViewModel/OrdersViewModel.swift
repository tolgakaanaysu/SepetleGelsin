//
//  OrdersViewModel.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 19.01.2022.
//

import Foundation

final class OrdersViewModel: ObservableObject {
    
    @Published var pastOrdersList = [PastOrderModel]()
    
    var categorizeDate: [String: [PastOrderModel]] {
        Dictionary(grouping: pastOrdersList,
                   by: {$0.date})
    }
}



