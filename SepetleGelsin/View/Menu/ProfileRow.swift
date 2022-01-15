//
//  ProfileRow.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 15.01.2022.
//

import SwiftUI



struct ProfileRow: View {
    var systemImageName: String
    var rowText: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 20, height: 25)
                .padding(.trailing, 20)
                
            Text(rowText)
        }
        
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(systemImageName: "person", rowText: "ad soyad")
    }
}
