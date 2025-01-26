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

            ShoppingCartView()
                .tabItem {
                    Label("Sepet", systemImage: "cart")
                }
                .tag(Tab.cartPage)
                .badge(viewModel.shoppingCartList.count)

            FavoritesList()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .renderingMode(.template)
                        .foregroundColor(.red)
                        .accentColor(.red)
                    Text("Favorilerim")
                }
                .tag(Tab.favoriteList)

            LogoutView()
                .tabItem {
                    Label("Hesap", systemImage: "person.crop.circle")
                }
                .tag(Tab.logoutView)
        }
        .accentColor(.applicationColor)

    }

}

struct PreviewWrapper<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .environmentObject(ShoppingCartVM())
            .environmentObject(HomepageVM())
            .environmentObject(FavoriteListVM())
            .environmentObject(SessionServiceImpl())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            ContentView()
        }
    }
}
