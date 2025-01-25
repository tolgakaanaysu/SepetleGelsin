
import SwiftUI

struct CreditCardView: View {
    @State private var degrees: Double = 0
    @Binding var flipped: Bool {
        didSet {
            degrees += 180
        }
    }
    @Binding var name: String
    @Binding var expires: String
    @Binding var cvv: String
    @Binding var cardNumber: String

    var body: some View {
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
        .onTapGesture {
            withAnimation {
                flipped.toggle()
            }
        }
    }
}

struct CreditCardFrontView: View {
    let name: String
    let cardNumber: String
    let expires: String

    var companyType: CreditCardCompanyType { .init(cardNumber: cardNumber) }

    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)

                Spacer()

                Text(companyType.rawValue)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }

            Spacer()

            Text(cardNumber)
                .foregroundColor(Color.white)
                .font(.system(size: 32))
            
            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    Text("KART SAHİBİ")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }

                Spacer()

                VStack {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Text(expires)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: 300, height: 200)
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: companyType.gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(10)
    }
}

struct CreditCardBackView: View {
    
    let cvv:String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
            
            Spacer()
            
            HStack {
                
                Text(cvv).foregroundColor(Color.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20)
                    .background(Color.white)
                
                
                Spacer()

            }.padding()
        }.frame(width: 300, height: 200)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
        .cornerRadius(10)
    }
}

