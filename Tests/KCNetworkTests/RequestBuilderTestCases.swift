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
        
        XCTAssert(tempRequest.url?.path.contains("search") ?? false)
    }
}
