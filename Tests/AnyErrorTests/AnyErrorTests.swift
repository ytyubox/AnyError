import XCTest
@testable import AnyError

enum TestError:LocalizedError {
    case aError
    var failureReason: String? {
        "test reason"
    }
    var recoverySuggestion: String? {
        "test suggestion"
    }
    var helpAnchor: String? {
        "test anchor"
    }
    var errorDescription: String? {
        "test error description"
    }
}

final class AnyErrorTests: XCTestCase {
    func testCustomLocalizedError() {
        let error = TestError.aError
        let anyError = AnyError(error)
        
        XCTAssertEqual(anyError.failureReason,
                       "test reason")
        XCTAssertEqual(anyError.recoverySuggestion,
                       "test suggestion")
        XCTAssertEqual(anyError.helpAnchor,
                       "test anchor")
        XCTAssertEqual(anyError.errorDescription,
                       "test error description")
        XCTAssertEqual(anyError.localizedDescription,
                       "test error description")
    }
    func testNSErrorConvertibility() {
        var userinfo:[String:Any] = [:]
        if #available(OSX 10.13, *) {
            userinfo = [
                kCFErrorLocalizedFailureReasonKey! as String: "test reason",
                NSLocalizedRecoverySuggestionErrorKey:"test suggestion",
                NSLocalizedRecoveryOptionsErrorKey:["test anchor"],
                NSLocalizedDescriptionKey: "test error description",
            ]
        } else {
            // Fallback on earlier versions
        }
        let error = NSError(
            domain: "test domain",
            code: 100,
            userInfo: userinfo)
//        error.localizedFailureReason = "test reason"
        
        let anyError = AnyError(error)
        
        XCTAssertEqual(anyError.failureReason,
                       "test reason")
        XCTAssertEqual(anyError.recoverySuggestion,
                       "test suggestion")
        XCTAssertEqual(anyError.helpAnchor,
                       "test anchor")
        XCTAssertEqual(anyError.errorDescription,
                       "test error description")
        XCTAssertEqual(anyError.localizedDescription,
                       "test error description")
    }
    func testAnyErrorWithMessage() {
        let error = "test message"
        let anyError = AnyError(message: error)
        
        XCTAssertEqual(anyError.failureReason,
                       nil)
        XCTAssertEqual(anyError.recoverySuggestion,
                       nil)
        XCTAssertEqual(anyError.helpAnchor,
                       nil)
        XCTAssertEqual(anyError.errorDescription,
                       nil)
        XCTAssertEqual(anyError.localizedDescription,
                       "test message")
    }
    func testInitWithArgument() {
        let anyError = AnyError()
        
        XCTAssertEqual(anyError.failureReason,
                       nil)
        XCTAssertEqual(anyError.recoverySuggestion,
                       nil)
        XCTAssertEqual(anyError.helpAnchor,
                       nil)
        XCTAssertEqual(anyError.errorDescription,
                       nil)
        XCTAssertEqual(anyError.localizedDescription,
                       "未知的錯誤")
    }
    

    static var allTests = [
        ("testCustomLocalizedError", testCustomLocalizedError),
    ]
}
