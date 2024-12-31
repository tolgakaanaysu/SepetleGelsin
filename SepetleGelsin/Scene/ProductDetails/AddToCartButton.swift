//
//  AddToCartButton.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 31.12.2021.
//

import SwiftUI
import Utility
import Foundation

struct AddToCartButton: View {
    var onAction: CompletionBlock

    var body: some View {
        Button{
            onAction()
        } label: {
            Text("Sepete Ekle")
                .font(.title2 )
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,18)
                .frame(width: screenBounds.width * 0.4,
                       height: screenBounds.height * 0.06,
                       alignment: .center)
                .background(Color.applicationColor)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.15),
                        radius: 5, x:10 , y: 5)
        }
    }
}

#if DEBUG
struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton() {
            print("Clicked AddToCartButton")
        }
    }
}
#endif
