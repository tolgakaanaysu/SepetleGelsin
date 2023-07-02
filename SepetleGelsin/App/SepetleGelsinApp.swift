import SwiftUI

@main
struct SepetleGelsinApp: App {
    @StateObject private var productVM = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                    TabBarView()
                        .environmentObject(productVM)
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
