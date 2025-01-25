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
    @StateObject private var shoppingCartVM = ShoppingCartVM()
    @StateObject private var favoriteListVM = FavoriteListVM()
    @StateObject private var homepageVM = HomepageVM()
    @StateObject private var sessionservice = SessionServiceImpl()
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate

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
                .environmentObject(shoppingCartVM)
                .environmentObject(favoriteListVM)
                .environmentObject(homepageVM)
                .environmentObject(sessionservice)
        }
    }
}
