//
//  File.swift
//  
//
//  Created by Sean Brody on 12/2/19.
//

import IntcodeComp
var part1Input = input
part1Input[1] = 12
part1Input[2] = 2
let comp = IntcodeComp(code:part1Input)
comp.registerInstructions([SharedInstructions.add, SharedInstructions.multiply, SharedInstructions.halt])
comp.run()
print("Part 1:",comp.state.memory[0])
outerloop: for noun in 0...99 {
  for verb in 0...99 {
    var part2Input = input
    part2Input[1] = noun
    part2Input[2] = verb
    let comp = IntcodeComp(code:part2Input)
    comp.registerInstructions([SharedInstructions.add, SharedInstructions.multiply, SharedInstructions.halt])
    comp.run()
    if comp.state.memory[0] == 19690720 {
      print("Part 2:", noun*100 + verb)
      break outerloop
    }
  }
}
