//
//  PaymentVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 31.12.2024.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI
import Utility

final class PaymentVM: ObservableObject {
    var db = Firestore.firestore()
    func buy(
        list: [ProductModel: Int],
        completion: @escaping ProcessCompletionBlock<Any>
    ) {
        let user = Auth.auth().currentUser
        let uid = user?.uid
        var count = 0
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "tr_TR_POSIX")

        let label = UILabel()
        label.text = dateFormatter.string(from: Date())
        for (product, quantity) in list {
            let docData: [String: Any] =
            [String(count):
                ["ID" : product.id,
                 "Adet" : quantity,
                 "Fiyat" : product.price]]
            count = count + 1
            db.collection(String(uid!)).document(String(dateFormatter.string(from: Date()))).setData(docData , merge: true) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                    completion(.failure(err))
                } else {
                    print("Document successfully written!")
                    completion(.success(nil))
                }

            }
        }
    }
}
