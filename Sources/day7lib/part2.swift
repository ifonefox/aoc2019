import IntcodeComp
public func part2(_ input:[Int]) -> Int {
  let code = input
  
  func makeComp(phase:Int, code:[Int]) -> IntcodeComp {
    let comp = IntcodeComp(code: code)
    comp.registerInstructions(SharedInstructions.all)
    comp.state.input = [phase]
    return comp
    
  }
  var maxValue = 0
  for a in 5...9 {
    for b in 5...9 {
      if a != b {
        for c in 5...9 {
          if c != a && c != b {
            for d in 5...9 {
              if d != a && d != b && d != c {
                for e in 5...9 {
                  if e != a && e != b && e != c && e != d {
                    let compA = makeComp(phase: a, code: code)
                    let compB = makeComp(phase: b, code: code)
                    let compC = makeComp(phase: c, code: code)
                    let compD = makeComp(phase: d, code: code)
                    let compE = makeComp(phase: e, code: code)
                    var out = 0
                    while !compE.state.halted {
                      compA.state.input.append(out)
                      compA.run()
                      out = compA.state.output.last!
                      compB.state.input.append(out)
                      compB.run()
                      out = compB.state.output.last!
                      compC.state.input.append(out)
                      compC.run()
                      out = compC.state.output.last!
                      compD.state.input.append(out)
                      compD.run()
                      out = compD.state.output.last!
                      compE.state.input.append(out)
                      compE.run()
                      out = compE.state.output.last!
                    }
                    if(out > maxValue){
                      maxValue = out
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  return maxValue
  
}
