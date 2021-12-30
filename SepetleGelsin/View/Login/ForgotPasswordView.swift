//
//  ForgotPasswordView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                InputTextFieldView(text: .constant(""),
                                   placeholder: "E-Mail",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                ButtonView(title:"Şifre Yenileme Bağlantısı Gönder")
                {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Şifremi Unuttum")
            .applyClose()
            .foregroundColor(Color.green)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
            ForgotPasswordView()
    }
}
