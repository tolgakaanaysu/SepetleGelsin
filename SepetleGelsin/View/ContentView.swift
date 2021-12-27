import SwiftUI
import Firebase

struct ContentView: View {
    @State private var selection: Tab = .homePage

    enum Tab {
        case homePage
        case searchView
        case favoriteList
        case menuList
        case loginView
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
           
                .tabItem {
                    Label("Anasayfa", systemImage: "house")
                }
                .tag(Tab.homePage)
            
           /* SearchView()
                .tabItem {
                    Label("Ara", systemImage: "magnifyingglass")
                }
                .tag(Tab.searchView)
            
            FavoritesList()
                .tabItem {
                    Label("Favorilerim", systemImage: "heart")
                }
                .tag(Tab.favoriteList)
            MenuList()
                .tabItem{
                    Label("Menü", systemImage: "list.bullet")
                }
                .tag(Tab.menuList) */
            LoginView()
                .tabItem {
                    Label("Hesap", systemImage: "person.crop.circle")
                }
                .tag(Tab.loginView)
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductViewModel())
    }
}
