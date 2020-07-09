import Foundation
protocol AnyErrorProtocol:LocalizedError {
    
}
public
struct AnyError<E:Error>:AnyErrorProtocol {
    public init(_ _error: E?) {
        self._error = _error
        self._message = nil
    }
    
    var _error:E?
    var _message:String?
    var localizedDescription: String {
        (_error?.localizedDescription ?? _message) ?? "未知的錯誤"
    }
}
extension AnyError where E == Error {
    public init(message:String) {
        self._error = nil
        self._message = message
    }
    public init() {
        self._error = nil
        self._message = nil
    }
}


extension AnyError where E == NSError {
    public var failureReason: String? {
        _error?.localizedFailureReason
    }
    public var recoverySuggestion: String? {
        _error?.localizedRecoverySuggestion
    }
    public var helpAnchor: String? {
        _error?.localizedRecoveryOptions?.joined(separator: " ")
    }
    public var errorDescription: String? {
        _error?.localizedDescription
    }
    
}

extension AnyError where E: LocalizedError {
    public var failureReason: String? {
        _error?.failureReason
    }
    public var recoverySuggestion: String? {
        _error?.recoverySuggestion
    }
    public var helpAnchor: String? {
        _error?.helpAnchor
    }
    public var errorDescription: String? {
        _error?.errorDescription
    }
    
}
