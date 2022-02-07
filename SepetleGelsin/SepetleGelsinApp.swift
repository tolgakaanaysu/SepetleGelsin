import SwiftUI
import Firebase


final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SepetleGelsinApp: App {
    @StateObject var stateObject = ProductViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionservice = SessionServiceImpl()
    
    var body: some Scene {
        WindowGroup {
           
        
          ContentView()
               .environmentObject(stateObject)
          
            /*
            NavigationView{
                switch sessionservice.state {
                case .loggedIn:
                    LogoutView()
                        .environmentObject(sessionservice)
                        
                    
                case .loggedOut:
                    LoginView()
                }
            }*/
        }
    }
}
