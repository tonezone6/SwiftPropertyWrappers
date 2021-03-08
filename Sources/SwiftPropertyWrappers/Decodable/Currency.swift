
import Foundation

@propertyWrapper
public struct Currency {
            
    public let wrappedValue: String

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.currency() // Current locale.
    }
}

extension Currency: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self.init(wrappedValue: value)
    }
}

public extension Locale {
    
    static let us = Locale(identifier: "en_US")
    static let uk = Locale(identifier: "en_UK")
}

private extension String {
       
    func currency(
        withLocale locale: Locale = .current,
        andSymbol symbol: String? = nil) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = symbol
        formatter.locale = locale
        
        guard let value = Double(self) else {
            return "N/A"
        }
        let number = NSNumber(value: value)
        guard let string = formatter.string(from: number) else {
            return "N/A"
        }
        return string
    }
}
