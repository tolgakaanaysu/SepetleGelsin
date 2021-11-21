import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .homePage

    enum Tab {
        case homePage
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
            
            FavoritesList()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
                .tag(Tab.favoriteList)
            MenuList()
                .tabItem{
                    Label("Menu", systemImage: "list.bullet")
                }
                .tag(Tab.menuList)
            
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductViewModel())
    }
}
