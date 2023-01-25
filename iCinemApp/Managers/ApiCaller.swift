import Foundation
import Alamofire

struct Constants {
    static let API_KEY = "71bc812fea6af7b9c86a330b9f5757c6"
    static let BASE_URL = "https://api.themoviedb.org/"
}

class ApiCaller {
    static let shared = ApiCaller()
    
    @discardableResult
    func executeGetCall<T: Codable>(api: APIREQUEST, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) -> Request {
        let request = AF.request(api).responseData { response in
            switch response.result {
            case .success(let data):
                
                if let result = try? JSONDecoder().decode(T.self, from: data) {
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    let error = NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Errore metodo GET"])
                    completion(.failure(error))
                }
                break
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                break
            }
        }
        return request
    }
    
    
//    func getTrendingMovies(compeltion: @escaping (String) -> Void) {
//
//        guard let url = URL(string: "\(Constants.BASE_URL)3/trending/all/day?api_key=71bc812fea6af7b9c86a330b9f5757c6")
//    }
}
