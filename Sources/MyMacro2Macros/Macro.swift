import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct Plugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    StateMacro.self,
    StateMemberMacro.self,
    PropertyMacro.self
  ]
}
