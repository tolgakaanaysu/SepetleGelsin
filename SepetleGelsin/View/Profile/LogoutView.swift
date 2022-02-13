//
//  LogoutView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//
import SwiftUI

struct LogoutView: View {
    @State private var showOrders = false
    @EnvironmentObject var sessionService: SessionServiceImpl
    @ObservedObject var ordersViewModel =  OrdersViewModel()
  
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack() {
                Text("Hoşgeldiniz \(sessionService.userDetails?.firstName ?? "N/A)")")
                Text((sessionService.userDetails?.lastName ?? "N/A)"))
            }
            .frame(height: UIScreen.main.bounds.size.height * 0.60)
            ButtonView(title: "Siparişlerim")
            {
                showOrders.toggle()
            }
            .sheet(isPresented: $showOrders,
                   content: {
                OrdersList()
                    .environmentObject(OrdersViewModel())
            })
            ButtonView(title: "Çıkış Yap")
            {
                sessionService.logout()
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Profil")
        .navigationBarHidden(true)
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
