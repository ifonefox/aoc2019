public class Node: Equatable {

  
  var name:String
  var branches:[Node]
  var parent:Node?
  init(name:String){
    self.name = name
    self.branches = []
    self.parent = nil
  }
  public static func == (lhs: Node, rhs: Node) -> Bool {
    return lhs.name == rhs.name
  }
  public static func parseData(data:[String]) -> (root:Node, data:[String:Node]){
    let root = Node(name:"COM")
    var allnodes = Dictionary<String,Node>()
    allnodes[root.name] = root
    let parsedData = data.map{(i) in
      i.split(separator: ")").map{ q in
        return String(q)
      }
    }
    for stringPair in parsedData {
      let nodePair = stringPair.map() { name -> Node in
        if let foundNode = allnodes[name] {
          return foundNode
        } else {
          let newNode = Node(name: name)
          allnodes[name] = newNode
          return newNode
        }
      }
      nodePair[0].branches.append(nodePair[1])
      nodePair[1].parent = nodePair[0]
    }
    return (root, allnodes)
  }
  public static func parseAndGetRoot(data:[String]) -> Node{
    return Node.parseData(data: data).root
  }
  public static func parseAndGetMap(data:[String]) -> [String:Node] {
    return Node.parseData(data:data).data
  }
  func getScore(score:Int) -> Int {
    let childrenScores = self.branches.map() { child -> Int in
      return child.getScore(score:score+1)
    }
    return childrenScores.reduce(score) { (accul, cur) -> Int in return accul + cur}
  }
  public func getScore() -> Int {
    return self.getScore(score:0)
  }
  public func findPath(to target:Node) -> Int {
    var visited:[Node] = []
    var queue:[Node] = []
    var nextLayer:[Node] = [self]
    var score = -1
    while nextLayer.count > 0 {
      queue = nextLayer
      nextLayer = []
      for current in queue {
        let parent:[Node]
        if let optionalParent = current.parent {
          parent = [optionalParent]
        } else {
          parent = []
        }
        for possible in current.branches + parent {
          if !visited.contains(possible) {
            if(possible == target) {
              return score
            } else {
              visited.append(possible)
              nextLayer.append(possible)
            }
          }
        }
      }
      score += 1
    }
    return score
  }

}

