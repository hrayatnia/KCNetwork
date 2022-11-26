import XCTest
import KCTestUtil
@testable import KCNetwork

final class RequestBuilderTestCase: XCUnitTestCase {
    
    private var request: Request!
    
    override func setUpWithError() throws {
        loadConfig()
        request = Request(url: URL(string:"https://google.com")!)
        try super.setUpWithError()
    }
    
    func testSetPath() {
        @RequestBuilder(requestable: [
        URIPath("/search")
        ], wrappedValue: request)
        var tempRequest: Request
        
        XCTAssert(tempRequest.url?.absoluteString.contains("search") ?? false)
    }
    
    func testSetHeader() {
        @RequestBuilder(requestable: [
            ["Auth":"Test"]
        ],
                        wrappedValue: request)
        var tempRequest: Request
        
        XCTAssert(tempRequest.allHTTPHeaderFields?.contains(where: { $0.key == "Auth" && $0.value == "Test"}) ?? false)
    }
    
    func testSetMethod() {
        @RequestBuilder(requestable: [
            HTTPMethod.PATCH,
        ],
                        wrappedValue: request)
        var tempRequest: Request
        
        XCTAssert(tempRequest.httpMethod == HTTPMethod.PATCH.rawValue)
        
    }
    
    func testSetQueryItem() {
        @RequestBuilder(requestable: [
            HTTPMethod.GET,
            URIPath("/sample"),
            QueryItem(name: "test", value: "testing")
        ],
                        wrappedValue: request)
        var tempRequest: Request
        print(tempRequest)
        XCTAssert(tempRequest.url?.absoluteString.contains("test=testing") ?? false)
        
    }
}
