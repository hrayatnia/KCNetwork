import Foundation

public typealias QueryItem = URLQueryItem

extension QueryItem: Requestable {
    public func set(_ request: Request) -> Request {
        guard let path = request.url?.absoluteString,
              var url = URLComponents(string: path) else { fatalError() }
        url.queryItems = url.queryItems != nil ? url.queryItems! + [self] : [self]
        request.url = url.url
        return request
    }
    
    
}
