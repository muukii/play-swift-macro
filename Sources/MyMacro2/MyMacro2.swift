
@attached(memberAttribute)
@attached(conformance)
@attached(member, names: arbitrary)
public macro State() = #externalMacro(module: "MyMacro2Macros", type: "StateMacro")

@attached(accessor)
public macro StateMember() = #externalMacro(module: "MyMacro2Macros", type: "StateMemberMacro")

@freestanding(expression)
public macro property<T, U>(sourceType: T.Type? = nil, _ keyPath: KeyPath<T, U>) -> ((T) -> (U))

= #externalMacro(module: "MyMacro2Macros", type: "PropertyMacro")


