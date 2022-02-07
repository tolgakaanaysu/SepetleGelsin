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
        List (model.list) { item in
            Text(item.id)
        }
    }
    
    init () {
        model.getData()
    }
}

struct Deneme_Previews: PreviewProvider {
    static var previews: some View {
        Deneme()
    }
}
