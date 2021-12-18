import SwiftUI
import Firebase

struct ContentView: View {
    @State private var selection: Tab = .homePage

    enum Tab {
        case homePage
        case searchView
        case favoriteList
        case menuList
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
           
                .tabItem {
                    Label("HomePage", systemImage: "house")
                }
                .tag(Tab.homePage)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle.fill")
                }
                .tag(Tab.searchView)
            
            FavoritesList()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(Tab.favoriteList)
            
            MenuList()
                .tabItem{
                    Label("Menu", systemImage: "list.bullet")
                }
                .tag(Tab.menuList)
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "mustache.fill")
                }
            
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductViewModel())
    }
}
