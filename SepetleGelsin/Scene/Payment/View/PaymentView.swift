//
//  PayWall.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 6.02.2022.
//

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var shoppingCartVM: ShoppingCartVM
    @StateObject var viewModel = PaymentVM()
    @State private var showingAlert = false
    @State private var flipped = false
    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    @State private var cardNumber = ""
    @State private var addres = ""
    @State private var shouldNavigate = false

    var body: some View {
        VStack {
            creditCardView
            creditCardNameView
            creditCardNumberView
            expiresView
            cvvView
            Divider()
            addressTextFieldView
            Spacer()
            buyButtonView
            navigationLink
        }
        .padding(.top,50)
    }
}

// MARK: - View

private extension PaymentView {

    var creditCardView: some View {
        CreditCardView(
            flipped: $flipped,
            name: $name,
            expires: $expires,
            cvv: $cvv,
            cardNumber: $cardNumber
        )
    }

    var creditCardNameView: some View {
        TextField("Kart Sahibi", text: $name)
            .modifier(TextFieldModifier())
    }

    var creditCardNumberView: some View {
        TextField("Kart Numarası", text: $cardNumber)
            .setCharacterLimit($cardNumber, limit: 16)
            .modifier(TextFieldModifier())
            .keyboardType(.decimalPad)

    }

    var expiresView: some View {
        TextField("Valid Date", text: $expires)
            .modifier(TextFieldModifier())
            .keyboardType(.decimalPad )
    }

    var cvvView: some View {
        TextField("CVV", text: $cvv) { (editingChanged) in
            withAnimation {
                flipped.toggle()
            }
        } onCommit: {}
            .setCharacterLimit($cvv, limit: 3)
            .modifier(TextFieldModifier())
            .keyboardType(.decimalPad )
    }

    var addressTextFieldView: some View {

        TextField("Adres", text: $addres)
            .modifier(TextFieldModifier())
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
            paymentAlert
        }
    }

    var paymentAlert: Alert {
        Alert(
            title: Text("Sipariş Oluştur"),
            message: Text("Alışverişinizi tamamlamak ister misiniz?"),
            primaryButton: .destructive(Text("Hayır")),
            secondaryButton: .cancel(Text("Evet")) {
                viewModel.buy(list: shoppingCartVM.shoppingCartList) { info in
                    switch info {
                    case .success:
                        resetTextField()
                        shouldNavigate = true
                    case .failure:
                        shouldNavigate = false
                    }
                }
            })
    }

    var navigationLink: some View {
        NavigationLink("", isActive: $shouldNavigate, destination: {
            OrderingSuccessfulView()
        })
    }

}

// MARK: - ViewModifier

private extension PaymentView {
    struct TextFieldModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .textFieldStyle(.roundedBorder)
                .padding([.leading,.trailing, .top])
        }
    }
}

private extension PaymentView {
    func resetTextField() {
        name = ""
        cvv = ""
        expires = ""
        addres = ""
        cardNumber = ""
    }
}

#if DEBUG
struct PayWall_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
#endif
