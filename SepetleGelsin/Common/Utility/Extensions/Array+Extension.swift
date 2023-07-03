import Foundation

extension Array where Element: Equatable {
    mutating func remove(item: Element) {
        if let index = firstIndex(of: item) {
            remove(at: index)
        }
    }
}
