import SwiftUI

extension UIColor {
    
    public static var getBackgroundColor :  UIColor {
        return UIColor(named: "view-background-color") ?? UIColor.white
    }
}

extension Color {
    
    public static var getBackgroundColor:  Color {
        return Color(UIColor(named: "view-background-color") ?? UIColor.white)
    }
}
