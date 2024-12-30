import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: ShoppingCartVM

    @State private var selection: Tab = .homePage

    enum Tab {
        case homePage
        case searchView
        case cartPage
        case favoriteList
        case profilView
        case logoutView
    }


    var body: some View {
        TabView(selection: $selection) {
            HomepageView()
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

            LogoutView()
                .tabItem {
                    Label("Hesap", systemImage: "person.crop.circle")
                }
                .tag(Tab.logoutView)
        }
        .accentColor(Color.ourApplicationColor)
    }

}
