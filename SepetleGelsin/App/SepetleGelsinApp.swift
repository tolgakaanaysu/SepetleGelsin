import SwiftUI

@main
struct SepetleGelsinApp: App {
    @StateObject private var homapageVM = HomepageVM()
    @StateObject private var favoriteVM = FavoriteVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                    TabBarView()
                        .environmentObject(homapageVM)
                        .environmentObject(favoriteVM)
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
