//
//  CreditCardCompanyType.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 31.12.2024.
//
import SwiftUI

enum CreditCardCompanyType: String {
    case none = ""
    case visa = "Visa"
    case mastercard = "Mastercard"
    case americanExpress = "American Express"
    case discover = "Discover"
    case dinersClub = "Diners Club"
    case jcb = "JCB"
    case unionPay = "UnionPay"

    var gradientColors: [Color] {
        switch self {
        case .visa:
            return [
                Color(red: 26/255, green: 115/255, blue: 232/255), // #1A73E8
                Color(red: 66/255, green: 133/255, blue: 244/255)  // #4285F4
            ]
        case .mastercard:
            return [
                Color(red: 255/255, green: 95/255, blue: 0/255),   // #FF5F00
                Color(red: 255/255, green: 0/255, blue: 0/255)     // #FF0000
            ]
        case .americanExpress:
            return [
                Color(red: 0/255, green: 112/255, blue: 163/255),  // #0070A3
                Color(red: 0/255, green: 174/255, blue: 239/255)   // #00AEEF
            ]
        case .discover:
            return [
                Color(red: 245/255, green: 130/255, blue: 32/255), // #F58220
                Color(red: 0/255, green: 0/255, blue: 0/255)       // #000000
            ]
        case .dinersClub:
            return [
                Color(red: 0/255, green: 58/255, blue: 109/255),   // #003A6D
                Color(red: 176/255, green: 190/255, blue: 197/255) // #B0BEC5
            ]
        case .jcb:
            return [
                Color(red: 0/255, green: 168/255, blue: 89/255),   // #00A859
                Color(red: 191/255, green: 0/255, blue: 0/255),    // #BF0000
                Color(red: 0/255, green: 51/255, blue: 161/255)    // #0033A1
            ]
        case .unionPay:
            return [
                Color(red: 237/255, green: 27/255, blue: 36/255),  // #ED1B24
                Color(red: 0/255, green: 161/255, blue: 233/255)   // #00A1E9
            ]
        case .none:
            return [
                Color.green,
                Color(red: 64/255, green: 224/255, blue: 208/255)  // #40E0D0
            ]
        }
    }

    // Init with card number
    init(cardNumber: String) {
        guard !cardNumber.isEmpty else {
            self = .none
            return
        }
        let prefix = cardNumber.prefix(4)
        switch prefix {
        case _ where cardNumber.hasPrefix("4"):
            self = .visa
        case "51"..."55", "2221"..."2720":
            self = .mastercard
        case "34", "37":
            self = .americanExpress
        case "6011", "644"..."649", "65":
            self = .discover
        case "300"..."305", "36", "38", "39":
            self = .dinersClub
        case "3528"..."3589":
            self = .jcb
        case "62":
            self = .unionPay
        default:
            self = .none
        }
    }
}
