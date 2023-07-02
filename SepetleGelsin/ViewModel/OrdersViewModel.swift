//
//  OrdersViewModel.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 19.01.2022.
//



import Foundation

final class OrdersViewModel: ObservableObject {
    
    @Published var pastOrdersList = [pastOrders]()
    
    var categorizeDate: [String: [pastOrders]] {
        Dictionary(grouping: pastOrdersList,
                   by: {$0.date})
    }
}

extension OrdersViewModel {
    func fetchData() {
        print(self.pastOrdersList)
    }
}



