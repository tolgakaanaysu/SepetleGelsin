import Foundation

struct WebService {
  
    func getData(url: URL, completion: @escaping (Result<[Product]?,DownloaderError>) -> Void) {
           
           URLSession.shared.dataTask(with: url) { data, response, error in
               
           if let error = error {
               print(error.localizedDescription)
               completion(.failure(.badUrl))
           }
               
           guard let data = data, error == nil else {
               return completion(.failure(.noData))
           }
               
           guard let items = try? JSONDecoder().decode([Product].self, from: data) else {
               return completion(.failure(.dataParseError))
           }
               
               completion(.success(items))
           }.resume()
    }
}

enum DownloaderError: Error {
    case badUrl
    case noData
    case dataParseError
}
