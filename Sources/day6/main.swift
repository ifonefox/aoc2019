import day6lib

let (root, data) = Node.parseData(data:input)
print("Part 1", root.getScore()) //135690
let map = data
let you = map["YOU"]
let santa = map["SAN"]
print("Part 2",you!.findPath(to:santa!))
