public struct Part1 {
  static func cycle(_ input:[Int], at position:Int) -> [Int]? {
    var output = input;
    if(input[position] == 1){
      output[input[position+3]] = input[input[position+1]] + input[input[position+2]]
    } else if (input[position] == 2){
      output[input[position+3]] = input[input[position+1]] * input[input[position+2]]
    } else if(input[position] == 99){
      return nil;
    } else {
      print("err")
    }
    return output
  }
  public static func run(_ input:[Int]) -> [Int]{
    var opcodes = input;
    var position = 0;
    while(position < input.count){
      print(position)
      guard let output = cycle(opcodes, at: position) else {
        return opcodes
      }
      opcodes = output
      position += 4
      
    }
    return opcodes
  }
}
