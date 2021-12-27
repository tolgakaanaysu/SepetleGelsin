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
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
