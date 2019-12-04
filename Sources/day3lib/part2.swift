class IntersectionPoint: Point {
  var lines:[Line]
  init(x:Int, y:Int, lines:[Line]) {
    self.lines = lines
    super.init(x: x, y: y)
  }
}
func getLarger<T:Comparable>(_ first:T,_ second:T) -> T{
  if first > second {
    return first
  } else {
    return second
  }
}
func getSmaller<T:Comparable>(_ first:T,_ second:T) -> T{
  if first < second {
    return first
  } else {
    return second
  }
}
public func part2(_ list1:[String],_ list2:[String]) -> Int{
    let origin = Point(x:1,y:1)
    let instructions1 = list1.map({(str:String) -> Instruction in Instruction(fromString: str)})
    let instructions2 = list2.map({(str:String) -> Instruction in Instruction(fromString: str)})
    let path1 = makePath(from: origin, instructions1)
    let path2 = makePath(from: origin, instructions2)
    var bestScore = Int.max
    var line1score = 0
    for line1 in path1 {
        var line2score = 0
        for line2 in path2 {
            if let p = line1.intersect(line2){
              let score:Int
              if line1.type == .Horizontal {
                score = line1score + abs(line1.start - p.x) + line2score + abs(line2.start - p.y)
              } else {
                score = line1score + abs(line1.start - p.y) + line2score + abs(line2.start - p.x)
              }
              if score < bestScore {
                bestScore = score
              }
            }
            line2score = line2score + abs(line2.start - line2.end)
        }
      line1score = line1score + abs(line1.start - line1.end)
    }
    return bestScore
}
