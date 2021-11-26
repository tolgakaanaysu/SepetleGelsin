import SwiftUI

@main
struct SepetleGelsinApp: App {
    @StateObject var stateObject = ProductViewModel()
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(stateObject)
                
            
        }
        
    }
}
