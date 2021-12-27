//
//  LoginView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                
                InputTextFieldView(text: .constant(""), placeholder: "E-mail", keyboardType: .emailAddress, sfSymbol: "envelope")
                
                InputPasswordView(password: .constant(""), placeholder: "Şifre", sfSymbol: "lock")
            }
            HStack{
                Spacer()
                Button(action: {
                    showForgotPassword.toggle()
                }, label: {
                Text("Şifrenizi mi unuttunuz?")
                })
                    .font(.system(size: 16, weight: .bold))
                    .sheet(isPresented: $showForgotPassword, content: {ForgotPasswordView()})
            }
            VStack(spacing: 16) {
                ButtonView(title: "Giriş Yap"){
                    
                }
                ButtonView(title: "Kayıt Ol",
                           background: .clear,
                           foreground: .blue,
                           border: .blue){
                    showRegistration.toggle()
                }
                           .sheet(isPresented: $showRegistration, content: {RegisterView()})
            }
            
        }
        .padding(.horizontal, 15)
        .navigationTitle("Üye Girişi")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        LoginView()
            
        }
    }
}
