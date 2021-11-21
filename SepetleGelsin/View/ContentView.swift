import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .homePage

    enum Tab {
        case homePage
        case FavoriteList
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("HomePage", systemImage: "star")
                }
                .tag(Tab.homePage)
            
            FavoritesList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.FavoriteList)
            
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductViewModel())
    }
}
