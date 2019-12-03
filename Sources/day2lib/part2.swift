public struct Part2 {
  static func cycle(_ input:[Int], noun:Int, verb:Int) -> Int{
    var newInput = input;
    newInput[1] = noun
    newInput[2] = verb
    return Part1.run(newInput)[0];
  }
  public static func run(_ input:[Int], goal:Int) -> Int{
    for noun in 0...99 {
      for verb in 0...99 {
        if(cycle(input, noun: noun, verb: verb) == goal){
          return 100 * noun + verb;
        }
      }
    }
    return 0;
  }
}
