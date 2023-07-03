//
//  Deneme.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 19.01.2022.
//

import SwiftUI


struct Deneme: View {
    
    @ObservedObject var model = OrdersViewModel()
    var body: some View {
        List (model.pastOrdersList) { item in
            Text("Fiyat: \(item.price)")
            Text("Tarih: \(item.date)")
            Text("Ürün: \(item.productId)")
               
        }
    }
}

struct Deneme_Previews: PreviewProvider {
    static var previews: some View {
        Deneme()
    }
}
