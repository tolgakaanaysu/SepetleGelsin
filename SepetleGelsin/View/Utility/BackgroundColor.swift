import SwiftUI

extension Color {
    
    public static var myColor:  Color {
        return Color(UIColor(named: "view-background-color") ?? UIColor.white)
    }
}
