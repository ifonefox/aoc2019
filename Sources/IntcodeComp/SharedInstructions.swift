public struct SharedInstructions {
  private init(){
    
  }
  //Day 2
  public static let add = Instruction(code: 1, parameters: 3 ) {(rawParams, paramModes, oldState) -> State in
    var state = oldState
    var params = rawParams
    for i in 0...1 {
      if paramModes[i] == ParameterMode.Position {
        params[i] = oldState.memory[rawParams[i]]
      }
    }
    state.memory[params[2]] = params[0] + params[1]
    return state
  }
  public static let multiply = Instruction(code: 2, parameters: 3 ) {(rawParams, paramModes, oldState) -> State in
    var state = oldState
    var params = rawParams
    for i in 0...1 {
      if paramModes[i] == ParameterMode.Position {
        params[i] = oldState.memory[rawParams[i]]
      }
    }
    state.memory[params[2]] = params[0] * params[1]
    return state
  }
  public static let halt = Instruction(code: 99, parameters: 0) {(_, _, oldState) -> State in
    var state = oldState
    state.halted = true
    return state
  }
 
  public static let all = [add, multiply, halt]
}
