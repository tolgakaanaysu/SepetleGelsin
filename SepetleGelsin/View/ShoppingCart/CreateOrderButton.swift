//
//  CreateOrderButton.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 16.01.2022.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore


struct CreateOrderButton: View {
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: ProductViewModel
    var db = Firestore.firestore()
    var body: some View {
        Button (action: {
            showingAlert.toggle()
        }){
            Image(systemName: "arrow.forward")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Sipariş Oluştur"),
                  message: Text("Alışverişinizi tamamlamak ister misiniz?"),
                  primaryButton: .destructive(Text("Hayır")),
                  secondaryButton: .cancel(Text("Evet")) {
                let user = Auth.auth().currentUser
                let uid = user?.uid
                var count = 0
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .long
                dateFormatter.timeStyle = .short
                dateFormatter.locale = Locale(identifier: "tr_TR_POSIX")

                let label = UILabel()
                label.text = dateFormatter.string(from: Date())
                for listItem in viewModel.shoppingCartList {
                    let docData: [String: Any] =
                    [String(count):
                        ["ID" : listItem.id,
                        "Adet" : (viewModel.productQuantityDict[listItem.id] ?? 1),
                        "Fiyat"  : listItem.price,
                         "Tarih" : String(dateFormatter.string(from: Date()))]]
                    count = count + 1
                    db.collection(String(uid!)).document(String(dateFormatter.string(from: Date()))).setData(docData , merge: true) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                        
                }
                }
            })
        }
    }
}

struct CreateOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrderButton()
    }
}
