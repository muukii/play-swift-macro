

@attached(accessor)
public macro StateMember() = #externalMacro(module: "MyMacro2Macros", type: "StateMemberMacro")

@freestanding(expression)
public macro property<T, U0>(_ keyPath1: KeyPath<T, U0>) -> ((T) -> (U0)) = #externalMacro(module: "MyMacro2Macros", type: "PropertyMacro")

@freestanding(expression)
public macro property<T, U0, U1>(_ keyPath1: KeyPath<T, U0>, _ keyPath2: KeyPath<T, U1>) -> ((T) -> (U0, U1)) = #externalMacro(module: "MyMacro2Macros", type: "PropertyMacro")
