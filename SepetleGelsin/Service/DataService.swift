import Foundation

struct DataService {
    func loadData <T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Could not find \(filename) in main bound")
        }
        
        
        do {
            data = try Data (contentsOf: file)
        } catch {
                fatalError("Could not load \(filename) from main bound")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
            
        } catch {
            fatalError("Could not parse \(filename) as (T.self):\n\(error)")
        }
    }

    
}
