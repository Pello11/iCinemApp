import Foundation
import Alamofire

enum APIREQUEST {
    case trendMovies
}

extension APIREQUEST {
    var method: HTTPMethod {
        switch self {
        case .trendMovies: return .get
        }
    }
}
extension APIREQUEST {
    var baseUrl: String {
       return "https://api.themoviedb.org/"
    }
    
    var path: String {
        switch self {
        case .trendMovies: return "3/trending/all/day?api_key=71bc812fea6af7b9c86a330b9f5757c6"
        }
    }
}

extension APIREQUEST: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: "\(self.baseUrl)\(self.path)") else { fatalError() }
        let method = self.method
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
