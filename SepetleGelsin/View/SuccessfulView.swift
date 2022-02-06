//
//  SuccessfulView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 6.02.2022.
//

import SwiftUI

struct SuccessfulView: View {
    var body: some View {
        VStack{
        Image(systemName: "cart.circle.fill")
            .foregroundColor(Color.ourApplicationColor)
            .font(.system(size: 175))
            
            Text("Siparişiniz Başarıyla Oluşturuldu!")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(Color.ourApplicationColor)
        }
    }
}

struct SuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulView()
    }
}
