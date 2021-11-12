import SwiftUI

@main
struct SepetleGelsinApp: App {
    @StateObject private var stateObject = ProductViewModel()
    var body: some Scene {
        WindowGroup {
            CategoryHome(item: stateObject)
                .environmentObject(stateObject)
                
    
               
        }
    }
}
