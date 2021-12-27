import SwiftUI
import Firebase


@main

struct SepetleGelsinApp: App {
    @StateObject var stateObject = ProductViewModel()
    @StateObject var sessionservice = SessionServiceImpl()
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(stateObject)
            
//            NavigationView{
//                switch sessionservice.state {
//                case .loggedIn:
//                    LogoutView()
//                        .environmentObject(sessionservice)
//                case .loggedOut:
//                    LoginView()
//                }
//            }
                
            
        }
        
        
    }
}
