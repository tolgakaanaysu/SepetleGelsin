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


//Application color
extension UIColor {
    public static var ourApplicationColor: UIColor {
        return UIColor.green
    }
}

//Application color
extension Color {
    public static var ourApplicationColor: Color {
        return Color.green
    }
}

extension UIColor {
    public static var navigationBarColor: UIColor {
        return UIColor(named: "navigation-bar-color") ?? UIColor.white
    }
}
