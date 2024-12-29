//
//  LoginView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var showRegistration = false
    //Kayıt ol butonuna basılıp basılmadığını kontrol eder.
    @State private var showForgotPassword = false
    //Şifremi unuttum butonuna basılıp basılmadığını kontrol eder.
    
    @StateObject private var vm = LoginViewModelImp(service: LoginServiceImpl())
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $vm.credentials.email, placeholder: "E-mail", keyboardType: .emailAddress, sfSymbol: "envelope")
                
                InputPasswordView(password: $vm.credentials.password, placeholder: "Şifre", sfSymbol: "lock")
            }
            HStack{
                Spacer()
                //Şifremi unuttum butonuna basınca true/false olduğunu kontrol eder ve buna göre şifremi unuttum ekranı açılır.
                Button(action: {
                    showForgotPassword.toggle()
                }, label: {
                Text("Şifrenizi mi unuttunuz?")
                })
                    .font(.system(size: 16, weight: .bold))
                    .sheet(isPresented: $showForgotPassword, content: {ForgotPasswordView()})
                    .foregroundColor(Color.ourApplicationColor)
            }
            VStack(spacing: 16) {
                ButtonView(title: "Giriş Yap"){
                    vm.login()
                }
                
                //Kayıt Ol butonuna basınca true/false olduğunu kontrol eder ve buna göre kayıt ekranı açılır.
                
                ButtonView(title: "Kayıt Ol",
                           background: .clear,
                           foreground: .ourApplicationColor,
                           border: .ourApplicationColor){
                    showRegistration.toggle()
                }
                           .sheet(isPresented: $showRegistration, content: {RegisterView()})
            }
            
        }
        .padding(.horizontal, 15)
        .navigationTitle("Üye Girişi")
        .alert(isPresented: $vm.hasError,
               content: {
            if case .failed(let error) = vm.state {
                return Alert(
                    title: Text("Hata"),
                    message: Text(error.localizedDescription))
            }
            else {
                return Alert(
                title: Text("Hata"),
                message: Text("Yanlış giden bir şeyler var!"))
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        LoginView()
            
        }
    }
}
