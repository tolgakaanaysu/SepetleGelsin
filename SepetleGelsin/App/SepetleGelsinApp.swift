import SwiftUI

@main
struct SepetleGelsinApp: App {
    @StateObject private var homapageVM = HomepageVM()
    @StateObject private var favoriteVM = FavoriteVM()
    @StateObject private var cartVM = CartVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                    TabBarView()
                        .environmentObject(homapageVM)
                        .environmentObject(favoriteVM)
                        .environmentObject(cartVM)
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
