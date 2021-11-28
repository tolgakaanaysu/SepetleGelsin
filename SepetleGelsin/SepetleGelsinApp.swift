import SwiftUI
import Firebase


@main

struct SepetleGelsinApp: App {
    @StateObject var stateObject = ProductViewModel()
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(stateObject)
                
            
        }
        
        
    }
}
