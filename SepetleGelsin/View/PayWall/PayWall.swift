//
//  PayWall.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 6.02.2022.
//

import SwiftUI

struct PayWall: View {
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    @State private var cardNumber = ""
    @State private var addres = ""
    
     var body: some View {
         VStack {
             CreditCard {
                 
                 VStack {
                     Group {
                         if flipped {
                             CreditCardBack(cvv: cvv)
                         } else {
                             CreditCardFront(name: name,
                                             cardNumber: cardNumber,
                                             expires: expires)
                         }
                     }
                 }.rotation3DEffect(
                     .degrees(degrees),
                     axis: (x: 0.0, y: 1.0, z: 0.0)
                 )
                 
             }
             .onTapGesture {
                 withAnimation {
                     degrees += 180
                     flipped.toggle()
                 }
             }
             
             TextField("Name", text: $name)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding([.top,.leading,.trailing])
                 
             
             TextField("Expiration", text: $expires)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding([.leading,.trailing])
                 .keyboardType(.decimalPad )
             
             TextField("CardNumber", text: $cardNumber)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding([.leading,.trailing])
                 .keyboardType(.decimalPad )
             
             TextField("CVV", text: $cvv) { (editingChanged) in
                 withAnimation {
                     degrees += 180
                     flipped.toggle()
                 }
             } onCommit: {}
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .keyboardType(.decimalPad )
                 .padding([.leading,.trailing])
             
                 Divider()
             
             TextField("Adres", text: $addres)
                 .textFieldStyle(.roundedBorder)
                 .padding()
               
                 
             Spacer()
             
         }
         .padding(.top,50)
         
     }
    
    
    
 }

struct PayWall_Previews: PreviewProvider {
    static var previews: some View {
        PayWall()
    }
}
