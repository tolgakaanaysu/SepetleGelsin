import SwiftUI

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
