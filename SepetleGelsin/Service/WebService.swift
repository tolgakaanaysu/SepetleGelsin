import Foundation


struct WebService {
    
    func getData(url: URL) async throws -> [Product]   {
        
     
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try? JSONDecoder().decode([Product].self, from: data)
       
        return products ?? []
        
    }
    
}

//response yaz

enum DownloaderError: Error {
    case badUrl
    case noData
    case dataParseError
}
