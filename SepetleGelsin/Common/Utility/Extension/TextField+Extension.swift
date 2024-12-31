//
//  TextField+Extension.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 31.12.2024.
//

import SwiftUI

extension TextField {
    func setCharacterLimit(_ text: Binding<String>, limit: Int) -> some View {
        onChange(of: text.wrappedValue) { newValue in
            if newValue.count > limit {
                text.wrappedValue = String(newValue.prefix(limit))
            }
        }
    }
}

