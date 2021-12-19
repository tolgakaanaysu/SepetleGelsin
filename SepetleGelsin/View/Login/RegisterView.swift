//
//  RegisterView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct RegisterView: View {
    

    var body: some View {
        NavigationView{
            VStack(spacing:32) {
                VStack(spacing: 16) {
                        
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "E-mail",
                                       keyboardType: .emailAddress,
                                       sfSymbol: "envelope")
                        
                    InputPasswordView(password: .constant(""),
                                      placeholder: "Şifre",
                                      sfSymbol: "lock")
                    Divider()
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Ad",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Soyad",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    
                    
                }
                ButtonView(title: "Üye Ol") {
                    
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Kayıt Ol")
            .applyClose()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
