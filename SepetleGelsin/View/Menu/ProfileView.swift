
import SwiftUI
import Collections

struct ProfileView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    
    let dic: OrderedDictionary = ["Adresler":"house",
                                  "Siparişler":"star",
                                  "Kart Bilgileri":"creditcard"]
    
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    // 1. Section
                    Section {
                        // Name Surname
                        ProfileRow(systemImageName: "person", rowText: "Ad soyad")
                        // E Mail
                        ProfileRow(systemImageName: "envelope", rowText: "E posta")
                        
                    }
                    .frame(width: getScreen().width,
                            height: getScreen().height * 0.05,
                            alignment: .leading)
                    
                    // 2.Section
                    Section {
                        ForEach(dic.keys, id: \.self){ key in
                            NavigationLink {

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
