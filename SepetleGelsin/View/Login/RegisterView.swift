//
//  RegisterView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var vm = RegistrationViewModelImpl(service: RegistrationServiceImpl())

    var body: some View {
        NavigationView{
            VStack(spacing:32) {
                VStack(spacing: 16) {
                        
                    InputTextFieldView(text: $vm.userDetails.email,
                                       placeholder: "E-mail",
                                       keyboardType: .emailAddress,
                                       sfSymbol: "envelope")
                        
                    InputPasswordView(password: $vm.userDetails.password,
                                      placeholder: "Şifre",
                                      sfSymbol: "lock")
                    Divider()
                    InputTextFieldView(text: $vm.userDetails.firstName,
                                       placeholder: "Ad",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    InputTextFieldView(text: $vm.userDetails.lastName,
                                       placeholder: "Soyad",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    
                    
                }
                ButtonView(title: "Üye Ol") {
                    vm.register()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Kayıt Ol")
            .applyClose()
            .foregroundColor(Color.ourApplicationColor)
            .alert(isPresented: $vm.hasError, content: {
                if case .failed(let error) = vm.state {
                    return Alert(title: Text("Hata"), message: Text(error.localizedDescription))
                } else {
                    return Alert(title: Text("Hata"), message: Text("Yanlış giden bir şeyler var!"))
                }
            })
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
