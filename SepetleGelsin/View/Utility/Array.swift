extension Array where Element: Equatable {
    
    mutating func removeProduct(_ element: Element) {
        _ = firstIndex(of: element).flatMap {
            self.remove(at: $0)
        }
    }
}


