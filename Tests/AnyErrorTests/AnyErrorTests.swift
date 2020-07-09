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

    static var allTests = [
        ("testCustomLocalizedError", testCustomLocalizedError),
    ]
}
