import Foundation

public extension Encodable {
    func data(_ encoder: JSONEncoder = JSONEncoder()) -> Data? {
        return try? encoder.encode(self)
    }
}
