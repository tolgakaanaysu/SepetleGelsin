import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @State private var selection: Tab = .homePage
    enum Tab {
        case homePage
        case searchView
        case cartPage
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
            
           SearchView()
                .tabItem {
                    Label("Ara", systemImage: "magnifyingglass")
                }
                .tag(Tab.searchView)
            
            ShoppingCart()
                .tabItem {
                    Label("Sepet", systemImage: "cart")
                }
                .tag(Tab.cartPage)
                .badge(viewModel.shoppingCartList.count)
            
            FavoritesList()
                .tabItem {
                    Label("Favorilerim", systemImage: "heart")
                }
                .tag(Tab.favoriteList)
                .badge(viewModel.favoriteList.count)
                
            
            
            
            
            
            
//            MenuList()
//                .tabItem{
//                    Label("Menü", systemImage: "list.bullet")
//                }
//                .tag(Tab.menuList)
            
            LoginView()
                .tabItem {
                    Label("Hesap", systemImage: "person.crop.circle")
                }
                .tag(Tab.loginView)
        }

        .accentColor(Color.ourApplicationColor)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductViewModel())
    }
}
