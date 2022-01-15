
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var sectionNameArray = ["Adres Bilgilerim", "Geçmiş Siparişlerim", "Kart Bilgilerim"]
    
    var body: some View {
        NavigationView {
            
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
                    ForEach(sectionNameArray, id:\.self) { rowName in
                        NavigationLink(rowName) {
                            
                        }
                    }
                    
                }
                .frame(width: getScreen().width,
                        height: getScreen().height * 0.05,
                        alignment: .leading)
               
                
         
               
                
                
            }
            
        }
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
