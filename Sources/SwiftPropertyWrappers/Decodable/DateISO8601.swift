
import Foundation

@propertyWrapper
public struct DateISO8601 {
    
    public let wrappedValue: Date
    
    public init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
    }
}

extension DateISO8601: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        if let date = ISO8601DateFormatter().date(from: value) {
            wrappedValue = date
        } else {
            throw DecodingError.typeMismatch(
                Date.self,
                DecodingError.Context(codingPath: [],
                debugDescription: "Failed to decode ISO 8601 date. Invalid string format.")
            )
        }
    }
}
