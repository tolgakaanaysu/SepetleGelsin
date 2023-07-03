import SwiftUI

fileprivate enum Tab {
    case homepage
    case searchView
    case cartPage
    case favoriteList
}

struct TabBarView: View {
    // MARK: - Properties
    @EnvironmentObject private var viewModel: HomepageVM
    @EnvironmentObject private var favoriteVM: FavoriteVM
    @State private var selection: Tab = .homepage
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selection) {
            HomepageView()
                .tabItem {
                    Label("Anasayfa", systemImage: "house")
                }
                .tag(Tab.homepage)
            
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
        }
        .accentColor(Color.ourApplicationColor)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(HomepageVM())
            .environmentObject(FavoriteVM())
    }
}
