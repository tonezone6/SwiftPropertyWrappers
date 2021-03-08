
import Foundation

@propertyWrapper
public struct Capitalized {
    
    public let wrappedValue: String
    
    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

extension Capitalized: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self.init(wrappedValue: value)
    }
}
