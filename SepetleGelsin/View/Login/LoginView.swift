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
    
    @StateObject private var vm = LoginViewModelImp(service: LoginServiceImpl())
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $vm.credentials.email, placeholder: "E-mail", keyboardType: .emailAddress, sfSymbol: "envelope")
                
                InputPasswordView(password: $vm.credentials.password, placeholder: "Şifre", sfSymbol: "lock")
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
                    .foregroundColor(Color.green)
            }
            VStack(spacing: 16) {
                ButtonView(title: "Giriş Yap"){
                    vm.login()
                }
                ButtonView(title: "Kayıt Ol",
                           background: .clear,
                           foreground: .green,
                           border: .green){
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
