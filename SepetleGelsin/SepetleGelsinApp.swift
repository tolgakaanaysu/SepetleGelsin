import SwiftUI

@main
struct SepetleGelsinApp: App {
    @StateObject private var stateObject = ProductListViewModel()
    var body: some Scene {
        WindowGroup {
            CategoryHome(item: stateObject)
                .environmentObject(stateObject)
                
    
               
        }
    }
}
