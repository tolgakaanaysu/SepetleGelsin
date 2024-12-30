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
    @StateObject private var stateObject = ShoppingCartVM()
    @StateObject private var favoriteListVM = FavoriteListVM()
    @StateObject private var sessionservice = SessionServiceImpl()
    @StateObject private var homepageVM = HomepageVM()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
          ContentView()
//            NavigationView {
//                switch sessionservice.state {
//                case .loggedIn:
//                    ContentView()
//                        .navigationBarHidden(true)
//                        .navigationBarTitleDisplayMode(.inline)
//                case .loggedOut:
//                    LoginView()
//                        .navigationBarHidden(true)
//                        .navigationBarTitleDisplayMode(.inline)
//                        
//                }
//            }
            .environmentObject(favoriteListVM)
            .environmentObject(stateObject)
            .environmentObject(sessionservice)
            .environmentObject(homepageVM)
        }
    }
}
