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
  //Day 5 Part 1
  public static let writeFromInput = Instruction(code: 3, parameters: 1) {(params, modes, oldState) -> State in
    var state = oldState
    state.memory[params[0]] = state.input.removeFirst()
    return state
  }
  public static let readToOutput = Instruction(code: 4, parameters: 1) {(params, modes, oldState) -> State in
    let output:Int
    if(modes[0] == .Immediate){
      output = params[0]
    } else {
      output = oldState.memory[params[0]]
    }
    var state = oldState
    state.output.append(output)
    return state
  }
  // Day 5 Part 2
  public static let jumpIfTrue = Instruction(code:5, parameters: 2, overrideInstructionPointer:true) {(rawParams, modes, oldState) -> State in
    let value:Int
    var state = oldState
    var params = rawParams
    for i in 0...1 {
      if modes[i] == ParameterMode.Position {
        params[i] = oldState.memory[rawParams[i]]
      }
    }
    if params[0] != 0 {
      state.instructionPointer = params[1]
    } else {
      state.instructionPointer += 3
    }
    return state
  }
  public static let jumpIfFalse = Instruction(code:6, parameters: 2, overrideInstructionPointer:true) {(rawParams, modes, oldState) -> State in
    let value:Int
    var state = oldState
    var params = rawParams
    for i in 0...1 {
      if modes[i] == ParameterMode.Position {
        params[i] = oldState.memory[rawParams[i]]
      }
    }
    if params[0] == 0 {
      state.instructionPointer = params[1]
    } else {
      state.instructionPointer += 3
    }
    return state
  }
  public static let lessThan = Instruction(code: 7, parameters: 3 ) {(rawParams, paramModes, oldState) -> State in
    var params = rawParams
    for i in 0...1 {
      if paramModes[i] == ParameterMode.Position {
        params[i] = oldState.memory[rawParams[i]]
      }
    }
    var state = oldState
    if(params[0] < params[1]){
      state.memory[params[2]] = 1
    } else {
      state.memory[params[2]] = 0
    }
    return state
  }
  public static let equals = Instruction(code: 8, parameters: 3 ) {(rawParams, paramModes, oldState) -> State in
    var params = rawParams
    for i in 0...1 {
      if paramModes[i] == ParameterMode.Position {
        params[i] = oldState.memory[rawParams[i]]
      }
    }
    var state = oldState
    if(params[0] == params[1]){
      state.memory[params[2]] = 1
    } else {
      state.memory[params[2]] = 0
    }
    return state
  }
  public static let all = [add, multiply, halt, writeFromInput, readToOutput, jumpIfTrue, jumpIfFalse, lessThan, equals]
}
