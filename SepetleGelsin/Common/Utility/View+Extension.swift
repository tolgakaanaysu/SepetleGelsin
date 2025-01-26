import SwiftUI

extension View {
    var screenBounds: CGRect {
        UIScreen.main.bounds
    }
}

extension View {
    /// `ifLet` ile bir opsiyonel değeri kontrol eder ve uygular
    @ViewBuilder
    func ifLet<Value>(_ value: Value?, apply: (Self, Value) -> some View) -> some View {
        if let value = value {
            apply(self, value)
        } else {
            self
        }
    }
}
