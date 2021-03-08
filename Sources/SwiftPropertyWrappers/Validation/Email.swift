
import Foundation

@propertyWrapper
public struct Email {
    
    public var wrappedValue: String? {
        didSet {
            wrappedValue = wrappedValue?.email
        }
    }

    public init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue?.email
    }
}

private extension String {
    
    var valid: Bool {
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", email)
        return predicate.evaluate(with: self)
    }
    
    var email: String? {
        valid ? self : nil
    }
}
