//
//  OrdersViewModel.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 19.01.2022.
//



import Foundation
import Firebase

class OrdersViewModel: ObservableObject {
    
    @Published var pastOrdersList = [pastOrders]()
    
    var categorizeDate: [String: [pastOrders]] {
        Dictionary(grouping: pastOrdersList,
                   by: {$0.date})
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
                
            
                DispatchQueue.main.async {
                    for document in querySnapshot!.documents {
                        let dict = document.data()
                        
                        dict.forEach { key, value in
                            let orderItems = dict[key] as! [String: Any]
                            let date = document.documentID
                            let id = UUID().uuidString
                            let quaintity = orderItems["Adet"] as? Int ?? 0
                            let price = orderItems["Fiyat"] as? Double ?? 0.0
                            let procutID = orderItems["ID"] as? Int ?? 1
                            
                            self.pastOrdersList.append(pastOrders(id:  id, productId: procutID, quaintity: quaintity , price: price , date: date) )
                            print("append: ")
                            print(self.pastOrdersList)
                            
                        }
               
                      
                    }
                    
                }
                }
            
        }
        print("modelview: ")
        print(self.pastOrdersList)
    }
}



