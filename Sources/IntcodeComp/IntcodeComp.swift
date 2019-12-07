public struct State {
  public var memory:[Int]
  public var halted = false
  public var broke = false
  var instructionPointer:Int
  public var input:[Int] = []
  public var output:[Int] = []
  init(memory:[Int]) {
    self.memory = memory
    self.instructionPointer = 0
  }
  init(memory:[Int], input:[Int]){
    self.init(memory:memory)
    self.input = input
  }
  
}
public enum ParameterMode {
  case Position, Immediate
}
public class IntcodeComp {
  public var state:State
  var instructions:[Instruction?] = Array.init(repeating: nil, count: 100)
  public init(code:[Int]) {
    self.state = State(memory: code)
  }
  public func registerInstruction(_ inst:Instruction) {
    self.instructions[inst.code] = inst
}
  public func registerInstructions(_ instructionList:[Instruction]) {
    instructionList.forEach { i in
      self.registerInstruction(i)
    }
  }
  static func parseMode(opcode:Int, parameters:Int) -> [ParameterMode]{
    var result:[ParameterMode] = []
    var restParameters = opcode / 100
    for _ in 0..<parameters {
      let i = restParameters % 10
      restParameters /= 10
      if(i == 0){
        result.append(.Position)
      } else {
        result.append(.Immediate)
      }
    }
    return result
  }
  public func cycle(){
    let fullOpcode = self.state.memory[self.state.instructionPointer]
    guard let instr = self.instructions[fullOpcode % 100] else {
      self.state.broke = true
      self.state.halted = true
      print(state.instructionPointer, fullOpcode)
      return
    }
    let modes = IntcodeComp.parseMode(opcode: fullOpcode, parameters: instr.parameters)
    let paramsStart = self.state.instructionPointer + 1
    let params:[Int] = Array(self.state.memory[paramsStart..<(paramsStart + instr.parameters)])
    //print(fullOpcode, params)


    self.state = instr.run(params, modes, state)
    if(!instr.overrideInstructionPointer && !self.state.halted) {
      self.state.instructionPointer += instr.parameters + 1
    }
  }
  public func run(){
    while !self.state.halted {
      self.cycle()
    }
  }
}
public struct Instruction {
  var code: Int
  var parameters: Int
  var run:(([Int],[ParameterMode], State) -> State)
  var overrideInstructionPointer:Bool
  public init(code: Int, parameters: Int, overrideInstructionPointer:Bool = false, run: @escaping ([Int], [ParameterMode],State) -> State) {
    self.code = code
    self.parameters = parameters
    self.run = run
    self.overrideInstructionPointer = overrideInstructionPointer
  }
}

