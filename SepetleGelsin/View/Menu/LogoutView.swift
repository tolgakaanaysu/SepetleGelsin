//
//  LogoutView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct LogoutView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Ad: \(sessionService.userDetails?.firstName ?? "N/A)")")
                Text("Soyad: \(sessionService.userDetails?.lastName ?? "N/A)")")
            }
            .frame(height: UIScreen.main.bounds.size.height * 0.65)
            ButtonView(title: "Çıkış Yap")
            {
                sessionService.logout()
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Kullanıcı Bilgileri")
    }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LogoutView()
                .environmentObject(SessionServiceImpl())
        }
        
    }
}
