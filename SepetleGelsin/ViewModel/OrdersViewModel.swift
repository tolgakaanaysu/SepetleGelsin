//
//  OrdersViewModel.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 19.01.2022.
//

import Foundation
import Firebase

class OrdersViewModel: ObservableObject {
    
    @Published var list = [getOrders]()
    
    func getData() {
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        let uid = user?.uid
        let count = 0
        
        db.collection("ElIgtIo2caMGIQ5UsRlXwvKYmp03").getDocuments { snapshot, err in
            
            if err == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            return getOrders(id: d["ID"] as? String ?? "",
                                             qty: d["Adet"] as? String ?? "",
                                             price: d["Fiyat"] as? String ?? "",
                                             date: d.documentID)
                        }
                    }
                }
            }
            
            else {
                
            }
        }
    }
}
