// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import HomeControl

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import RxSwift
import RxBlocking
@testable import HomeControl

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif



// MARK: - WebService
class WebServiceMock: WebService, Mock {
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    var matcher: Matcher = Matcher.default


    typealias Property = Swift.Never


    func getResource<T>(_ resource: Resource, _ completion: @escaping ((Result<T>) -> ())) {
        addInvocation(.igetResource__resource_completion(Parameter<Resource>.value(resource), Parameter<(Result<T>) -> ()>.value(completion).wrapAsGeneric()))
		let perform = methodPerformValue(.igetResource__resource_completion(Parameter<Resource>.value(resource), Parameter<(Result<T>) -> ()>.value(completion).wrapAsGeneric())) as? (Resource, @escaping ((Result<T>) -> ())) -> Void
		perform?(resource, completion)
    }

    fileprivate enum MethodType {
        case igetResource__resource_completion(Parameter<Resource>, Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
                case (.igetResource__resource_completion(let lhsResource, let lhsCompletion), .igetResource__resource_completion(let rhsResource, let rhsCompletion)):
                    guard Parameter.compare(lhs: lhsResource, rhs: rhsResource, with: matcher) else { return false } 
                    guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                    return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .igetResource__resource_completion(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    struct Given {
        fileprivate var method: MethodType
        var returns: Any?
        var `throws`: Error?

        private init(method: MethodType, returns: Any?, throws: Error?) {
            self.method = method
            self.returns = returns
            self.`throws` = `throws`
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func getResource<T>(resource: Parameter<Resource>, completion: Parameter<(Result<T>) -> ()>) -> Verify {
            return Verify(method: .igetResource__resource_completion(resource, completion.wrapAsGeneric()))
        }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func getResource<T>(resource: Parameter<Resource>, completion: Parameter<(Result<T>) -> ()>, perform: (Resource, @escaping ((Result<T>) -> ())) -> Void) -> Perform {
            return Perform(method: .igetResource__resource_completion(resource, completion.wrapAsGeneric()), performs: perform)
        }
    }

    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
        methodReturnValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }
    public func verify(property: Property, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) { }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }

    private func methodReturnValue(_ method: MethodType) -> (value: Any?, error: Error?) {
        let matched = methodReturnValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher)  }
        return (value: matched?.returns, error: matched?.`throws`)
    }

    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }

    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
}

