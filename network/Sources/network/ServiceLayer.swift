import Alamofire

public protocol ServiceLayer {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var task: Task { get }
    var headers: [String: String]? {get}
}

public extension ServiceLayer {
    var baseUrl: String {
        "https://fakestoreapi.com"
    }
}


