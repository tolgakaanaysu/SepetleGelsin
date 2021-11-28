//
//  LoginScreen.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 28.11.2021.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        List{
            Text("Login")
                .font(.largeTitle)
                .bold()
            Section{
                VStack{
                    Text("E-Mail").bold()
                    TextField("Insert E-Mail", text: $email)
                    
                    
                }
            
                VStack{
                    Text("Password").bold()
                    SecureField("Insert Password", text: $password)
                }
            
            VStack{
            Button(action: {login() }) {
                Text("Sign In")
            }.background(Color.mint)
                    .foregroundColor(Color.white)
                    .cornerRadius(15)
                    .frame(width: 340, height: 40, alignment: .center)
                    .font(.title)
                    
            }
            }
        }
        
    }
    func login (){
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("Success")
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
