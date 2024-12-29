//
//  RegistrationDetails.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 22.12.2021.
//

import Foundation

struct RegistrationDetails {
    
    //Kayıt olurken kullanıcıdan alınacak değişkenler tanımlandı.
    
    var email: String
    var password: String
    var firstName: String
    var lastName: String
}

extension RegistrationDetails {
    static var new: RegistrationDetails {
        RegistrationDetails(email: "", password: "", firstName: "", lastName: "")
    }
}
