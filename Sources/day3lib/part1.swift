enum Alignment {
  case Horizontal, Virtical
}
enum Direction {
  case Up, Down, Left, Right, None
}
public struct Line:Equatable{
  var type:Alignment
  var start, end, location:Int
  func intersect(_ otherLine:Line) -> Point?{
    if(self.type == otherLine.type){
    } else {
      // self.start < otherLine.location < self.end || self.end < otherLine.location < self.start
      if (self.start < otherLine.location && otherLine.location < self.end) ||  (self.end < otherLine.location && otherLine.location < self.start){
        if (otherLine.start < self.location && self.location < otherLine.end) ||  (otherLine.end < self.location && self.location < otherLine.start){
          if(self.type == .Virtical){
            return Point(x: self.location, y: otherLine.location)
          } else {
            return Point(x: otherLine.location, y: self.location)
          }
        }
      }
    }
    return nil
  }
}
class Point:Equatable {
  static func == (lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }
  var x,y:Int
  init(x:Int, y:Int) {
    self.x = x
    self.y = y
  }
  func nextPath(_ info:Instruction) -> (Point, Line){
    switch info.dir {
    case .Up:
      let nextPoint = Point(x: self.x, y: self.y+info.length)
      return (nextPoint, Line(type: .Virtical, start: self.y, end: nextPoint.y, location:self.x))
    case .Down:
      let nextPoint = Point(x: self.x, y: self.y-info.length)
      return (nextPoint, Line(type: .Virtical, start: self.y, end: nextPoint.y, location:self.x))
    case .Left:
      let nextPoint = Point(x: self.x-info.length, y: self.y)
      return (nextPoint, Line(type: .Horizontal, start: self.x, end: nextPoint.x, location:self.y))
    case .Right:
      let nextPoint = Point(x: self.x+info.length, y: self.y)
      return (nextPoint, Line(type: .Horizontal, start: self.x, end: nextPoint.x, location:self.y))
    default:
      return (Point(x:0,y:0), Line(type: .Horizontal, start: 0, end: 0, location:0))
    }
  }
}
struct Instruction: Equatable {
  var dir:Direction
  var length:Int
  init(_ dir:Direction,_ length:Int) {
    self.dir = dir
    self.length = length
  }
  init(fromString info:String) {
    switch info.first {
    case "L":
      self.dir = .Left
    case "R":
      self.dir = .Right
    case "U":
      self.dir = .Up
    case "D":
      self.dir = .Down
    default:
      self.dir = .None
    }
    let range = info.index(info.startIndex, offsetBy: 1)
    let lengthString = info[range...]
    let len = Int(lengthString)!
    self.length = len
  }
  static func == (lhs: Instruction, rhs: Instruction) -> Bool {
    return lhs.dir == rhs.dir && lhs.length == rhs.length
  }
}
func makePath(from origin:Point, _ infos:[Instruction]) -> [Line] {
  var current = origin
  var newLine:Line
  var lines:[Line] = []
  for info in infos {
    (current, newLine) = current.nextPath(info)
    lines.append(newLine)
  }
  return lines
}
func findInsersects(_ path1:[Line], _ path2:[Line]) -> [Point] {
  var output:[Point] = []
  for line1 in path1 {
    for line2 in path2 {
      if let p = line1.intersect(line2) {
        output.append(p)
      }
    }
  }
  return output
}
func findShortest(to origin:Point, _ list:[Point]) -> Int{
  var shortestDistance = Int.max
  for p in list {
    let distance = abs(origin.x - p.x) + abs(origin.y - p.y)
    if distance < shortestDistance {
      shortestDistance = distance
    }
  }
  return shortestDistance
}
public func part1(_ list1:[String],_ list2:[String]) -> Int{
  let origin = Point(x:1,y:1)
  let instructions1 = list1.map({(str:String) -> Instruction in Instruction(fromString: str)})
  let instructions2 = list2.map({(str:String) -> Instruction in Instruction(fromString: str)})
  let lines1 = makePath(from: origin, instructions1)
  let lines2 = makePath(from: origin, instructions2)
  let intersects = findInsersects(lines1, lines2)
  let score = findShortest(to: origin, intersects)
  return score
}
