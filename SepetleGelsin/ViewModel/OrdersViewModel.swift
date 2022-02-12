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
    @Published var pastOrdersList = [pastOrders]()
    
    func getData() {
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        let uid = (user?.uid)!
        //let count = 0
        
        db.collection(uid).getDocuments { snapshot, err in
            
            if err == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            return getOrders(id: d.documentID)
                        }
                    }
                }
            }
            
            else {
                
            }
        }
    }
    
}

extension OrdersViewModel {
    func fetchData() {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        let uid = (user?.uid)!
        
        db.collection(uid).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                
                for document in querySnapshot!.documents {
                    
                    let dict = document.data()
                    dict.forEach { key, value in
                        let orderItems = dict[key] as! [String: Any]
                        let date = document.documentID
                        let id = UUID().uuidString
                        let quaintity = orderItems["Adet"] ?? 0
                        let price = orderItems["Fiyat"] ?? 0.0
                        let procutID = orderItems["ID"] ?? 1
                        print(date,price,quaintity,procutID)
                        DispatchQueue.main.async {
                            self.pastOrdersList.append(pastOrders(id:  id, productId: procutID as! Int, quaintity: quaintity as! Int, price: price as! Double, date: date) )
                        }
                    }
                    print("*********************")
                }
                
            }
        }
        
    }
}



