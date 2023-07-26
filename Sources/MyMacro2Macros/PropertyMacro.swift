import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct PropertyMacro: ExpressionMacro {
  public static func expansion(
    of node: some SwiftSyntax.FreestandingMacroExpansionSyntax,
    in context: some SwiftSyntaxMacros.MacroExpansionContext
  ) throws -> SwiftSyntax.ExprSyntax {

    let arguments = node.argumentList

    let tupleExpression = TupleExprElementListSyntax {
      for arg in arguments {
        let components = arg.cast(TupleExprElementSyntax.self).expression.cast(KeyPathExprSyntax.self).components
        let element = TupleExprElementSyntax.init(expression: ExprSyntax.init(stringLiteral: "$0\(components)"))
        element
      }
    }

    return "{ (\(tupleExpression)) }"
  }

}
