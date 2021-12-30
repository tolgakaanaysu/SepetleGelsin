//
//  LoginCredentials.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 30.12.2021.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}
