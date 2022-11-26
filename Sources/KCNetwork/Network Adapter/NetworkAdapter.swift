public protocol NetworkAdapter {
    
    func run<Response: Decodable>(request: Request,
             response: @escaping (Result<Response, Error>)->())
    
    func run<Response: Decodable>(request: Request) async -> Result<Response, Error>
}
