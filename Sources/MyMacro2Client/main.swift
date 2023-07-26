import MyMacro2

public protocol StateType {

  var modifiedIdentifiers: Set<String> { get set }
}

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

  var name: String = ""
}

let my = MyState()

let new = withObservingChanges(my) { state in
  state.name = "hello"
}

print(new.name, new.modifiedIdentifiers)

let a = #property(sourceType: String.self, \.count)
