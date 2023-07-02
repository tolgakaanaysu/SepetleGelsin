//
//  PayWall.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 6.02.2022.
//

import SwiftUI

struct PayWall: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    @State private var showingAlert = false
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    @State private var cardNumber = ""
    @State private var addres = ""
    
    @State var isSuccesful = false
    
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
            
            TextField("Kart Sahibi", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top,.leading,.trailing])
            
            TextField("Kart Numarası", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .keyboardType(.decimalPad )
            
            
            TextField("Valid Date", text: $expires)
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
            
            Button{
                if name != "" && expires != "" && cardNumber != "" && cvv != "" && addres != "" {
                    showingAlert.toggle()
                    
                }
                
            } label: {
                Text("Satın Al")
                    .font(.title2 )
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical,18)
                    .frame(width: getScreen().width * 0.4,
                           height: getScreen().height * 0.06,
                           alignment: .center)
                    .background(Color.ourApplicationColor)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.15),
                            radius: 5, x:10 , y: 5)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Sipariş Oluştur"),
                      message: Text("Alışverişinizi tamamlamak ister misiniz?"),
                      primaryButton: .destructive(Text("Hayır")),
                      secondaryButton: .cancel(Text("Evet")) { }
                )
            }
        }
        .padding(.bottom,50)
    }
}

struct PayWall_Previews: PreviewProvider {
    static var previews: some View {
        PayWall()
    }
}
