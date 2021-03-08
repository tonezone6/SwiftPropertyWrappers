
import Foundation

@propertyWrapper
public struct Password {
    
    public var wrappedValue: String? {
        didSet {
            wrappedValue = wrappedValue?.password
        }
    }

    public init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue?.password
    }
}

private extension String {
    
    var valid: Bool {
        /// min 8 characters
        /// at least 1 letter and 1 number
        let password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", password)
        return predicate.evaluate(with: self)
    }
    
    var password: String? {
        valid ? self : nil
    }
}
