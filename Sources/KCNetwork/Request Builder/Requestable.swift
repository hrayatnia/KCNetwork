
public protocol Requestable {
    @discardableResult
    func set(_ request: Request) -> Request
}
