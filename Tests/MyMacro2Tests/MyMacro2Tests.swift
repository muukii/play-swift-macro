import MyMacro2Macros
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

let testMacros: [String: Macro.Type] = [
  "State": StateMacro.self,
  "property": PropertyMacro.self
]

final class MyMacro2Tests: XCTestCase {

  func test_state() {
    assertMacroExpansion(
      #"""
      @State
      struct MyState {

      var name: String = ""
      var computed: String { "" }
      }
      """#,
      expandedSource: #"""
        ("Hello, \(name)", #""Hello, \(name)""#)
        """#,
      macros: testMacros
    )
  }

  func test_property() {
    assertMacroExpansion(
      #"""
      #property(\String.count)
      """#,
      expandedSource: #"""
        {
            ($0.count)
        }
        """#,
      macros: testMacros
    )
  }

  func test_property_2() {
    assertMacroExpansion(
      #"""
      #property(\String.count, \.a)
      """#,
      expandedSource: #"""
        {
            ($0.count, $0.a)
        }
        """#,
      macros: testMacros
    )
  }
}
