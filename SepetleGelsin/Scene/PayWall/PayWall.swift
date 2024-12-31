//
//  PayWall.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 6.02.2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct PayWall: View {
    @EnvironmentObject var viewModel: ShoppingCartVM
    @State private var showingAlert = false
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false

    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    @State private var cardNumber = ""
    @State private var addres = ""

    @State var isSuccesful = false
    var db = Firestore.firestore()

    var body: some View {
        VStack {
            creditCardImageView
            creditCardNameView
            creditCardNumberView
            expiresView
            cvvView
            Divider()
            addressTextFieldView

            Spacer()
            buyButtonView
            shouldNavigate
        }
        .padding(.top,50)

    }

    var buyButtonView: some View {
        Button{
            if name != "" && expires != "" && cardNumber != "" && cvv != "" && addres != "" {
                showingAlert.toggle()
            }
        } label: {
            Text("Satın Al")
                .font(.title2 )
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,18)
                .frame(width: screenBounds.width * 0.4,
                       height: screenBounds.height * 0.06,
                       alignment: .center)
                .background(Color.applicationColor)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.15),
                        radius: 5, x:10 , y: 5)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Sipariş Oluştur"),
                  message: Text("Alışverişinizi tamamlamak ister misiniz?"),
                  primaryButton: .destructive(Text("Hayır")),
                  secondaryButton: .cancel(Text("Evet")) {

                isSuccesful.toggle()

                name = ""
                cvv = ""
                expires = ""
                addres = ""
                cardNumber = ""


                let user = Auth.auth().currentUser
                let uid = user?.uid
                var count = 0
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .long
                dateFormatter.timeStyle = .short
                dateFormatter.locale = Locale(identifier: "tr_TR_POSIX")

                let label = UILabel()
                label.text = dateFormatter.string(from: Date())
                for (product, quantity) in viewModel.shoppingCartList {
                    let docData: [String: Any] =
                    [String(count):
                        ["ID" : product.id,
                         "Adet" : quantity,
                         "Fiyat" : product.price]]
                    count = count + 1
                    db.collection(String(uid!)).document(String(dateFormatter.string(from: Date()))).setData(docData , merge: true) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                            self.viewModel.clearCart()
                        }

                    }
                }
            }
            )
        }
    }

    private var creditCardImageView: some View {
        CreditCardView {
            VStack {
                Group {
                    if flipped {
                        CreditCardBackView(cvv: cvv)
                    } else {
                        CreditCardFrontView(
                            name: name,
                            cardNumber: cardNumber,
                            expires: expires
                        )
                    }
                }
            }.rotation3DEffect(
                .degrees(degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
        }
        .onTapGesture {
            withAnimation {
                degrees += 180
                flipped.toggle()
            }
        }
    }

    private var creditCardNameView: some View {
        TextField("Kart Sahibi", text: $name)
            .modifier(TextFieldModifier())
    }

    private var creditCardNumberView: some View {
        TextField("Kart Numarası", text: $cardNumber)
            .setCharacterLimit($cardNumber, limit: 16)
            .modifier(TextFieldModifier())
            .keyboardType(.decimalPad)

    }

    private var expiresView: some View {
        TextField("Valid Date", text: $expires)
            .modifier(TextFieldModifier())
            .keyboardType(.decimalPad )
    }

    private var cvvView: some View {
        TextField("CVV", text: $cvv) { (editingChanged) in
            withAnimation {
                degrees += 180
                flipped.toggle()
            }
        } onCommit: {}
            .setCharacterLimit($cvv, limit: 3)
            .modifier(TextFieldModifier())
            .keyboardType(.decimalPad )
    }

    private var addressTextFieldView: some View {

        TextField("Adres", text: $addres)
            .modifier(TextFieldModifier())
    }

    private var shouldNavigate: some View {
        NavigationLink("", isActive: $isSuccesful, destination: {
            OrderingSuccessfulView()
        })
    }

    private struct TextFieldModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .textFieldStyle(.roundedBorder)
                .padding([.leading,.trailing, .top])

        }
    }
}

#if DEBUG
struct PayWall_Previews: PreviewProvider {
    static var previews: some View {
        PayWall()
    }
}
#endif
