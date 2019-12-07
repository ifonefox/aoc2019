import IntcodeComp

public func part1 (_ input:[Int]) -> Int {
  let code = input
  
  func run(phase:Int, input:Int, code:[Int]) -> Int {
    let comp = IntcodeComp(code: code)
    comp.registerInstructions(SharedInstructions.all)
    comp.state.input = [phase, input]
    comp.run()
    return comp.state.output[0]
    
  }
  var maxValue = 0
  for a in 0...4 {
    for b in 0...4 {
      if a != b {
        for c in 0...4 {
          if c != a && c != b {
            for d in 0...4 {
              if d != a && d != b && d != c {
                for e in 0...4 {
                  if e != a && e != b && e != c && e != d {
                    var output = run(phase:a,input:0,code:code)
                    output = run(phase:b,input:output,code:code)
                    output = run(phase:c,input:output,code:code)
                    output = run(phase:d,input:output,code:code)
                    output = run(phase:e,input:output,code:code)
                    if(output > maxValue){
                      maxValue = output
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
