//
//  InputTextFieldView.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 18.12.2021.
//

import SwiftUI

struct InputTextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .keyboardType(keyboardType)
            .background(
            
                ZStack(alignment: .leading){
                    
                    if let systemImage = sfSymbol {
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.ourApplicationColor.opacity(0.75))
                }
            )
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
     
        
        InputTextFieldView(text: .constant(""), placeholder: "E-mail", keyboardType: .emailAddress, sfSymbol: "envelope")
                .preview(with: "Email Input")
        InputTextFieldView(text: .constant(""), placeholder: "İsim", keyboardType: .default, sfSymbol: nil)
                .preview(with: "First Name Input")
        }
    }
}
