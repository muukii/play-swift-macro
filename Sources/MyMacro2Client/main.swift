import MyMacro2

public protocol StateType {

  var modifiedIdentifiers: Set<String> { get set }
}

@attached(memberAttribute)
@attached(extension, conformances: StateType, names: arbitrary)
@attached(member, names: arbitrary)
public macro State() = #externalMacro(module: "MyMacro2Macros", type: "StateMacro")

public func withObservingChanges<State: StateType>(
  _ modifying: consuming State,
  modify: (inout State) -> Void
) -> State {
  var new = modifying
  new.modifiedIdentifiers = .init()
  modify(&new)
  return new
}

@State
struct MyState {

  var age: Int

  var name: String = ""
}

let my = MyState(_$age: 0)

let new = withObservingChanges(my) { state in
//  state.name = "hello"
}

print(new.name, new.modifiedIdentifiers)

do {
  let a = #property(\String.count)
}

do {
  let a = #property(\String.count, \.isEmpty)
}


do {
  let keyPath = \String.count
//  let a = #property(\String.count, keyPath)
}
