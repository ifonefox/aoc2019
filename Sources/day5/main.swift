import IntcodeComp

var comp = IntcodeComp(code:input)
comp.registerInstructions([SharedInstructions.add, SharedInstructions.multiply, SharedInstructions.halt, SharedInstructions.writeFromInput, SharedInstructions.readToOutput,
SharedInstructions.jumpIfTrue, SharedInstructions.jumpIfFalse, SharedInstructions.lessThan, SharedInstructions.equals])
comp.state.input = [1]
comp.run()
print("Part 1",comp.state.output)

comp = IntcodeComp(code:input)
comp.registerInstructions([SharedInstructions.add, SharedInstructions.multiply, SharedInstructions.halt, SharedInstructions.writeFromInput, SharedInstructions.readToOutput,
SharedInstructions.jumpIfTrue, SharedInstructions.jumpIfFalse, SharedInstructions.lessThan, SharedInstructions.equals])
comp.state.input = [5]
comp.run()
print("Part 2",comp.state.output)
