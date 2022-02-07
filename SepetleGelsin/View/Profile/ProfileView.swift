
import SwiftUI
import Collections

struct ProfileView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    
    let dic: OrderedDictionary = ["Addresses":"house",
                                  "PastOrders":"star",
                                  "CreditCardInfo":"creditcard"]
    
   
    
    enum RowKeys: String {
        case Addresses = "Addresses"
        case PastOrders  = "PastOrders"
        case CreditCardInfo = "CreditCardInfo"
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    // Name Surname
                    
                    
                    // 2.Section
                    Section {
                        ForEach(dic.keys, id: \.self){ key in
                            NavigationLink {
                                switch ProfileView.RowKeys(rawValue: key)! {
                                case RowKeys.Addresses:
                                    Addresses()
                                case RowKeys.PastOrders:
                                    Deneme()
                                case RowKeys.CreditCardInfo:
                                    CreditCardInfo()
                                }

                            }label: {
                                ProfileRow(systemImageName: dic[key]! , rowText: key)
                            }
                        }

                    }
                    .frame(width: getScreen().width,
                            height: getScreen().height * 0.05,
                            alignment: .leading)
                    
                }//: Form
                
                ButtonView(title: "Çıkış Yap")
                {
                    sessionService.logout()
                        
                }
                
                .padding(.bottom, 30)
                
                
            }//: VStack
            
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
            
        }//: N.V
        
//        .navigationBarHidden(true)
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
