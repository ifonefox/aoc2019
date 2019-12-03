public class Part1 {
  var fuel: [Int]
  
  init(_ fuel: [Int]) {
    self.fuel = fuel;
  }
  static func getFuel(forMass mass:Int) -> Int{
    return mass/3 - 2;
  }
  public static func sumFuel(fromMasses massList:[Int]) -> Int{
    return massList.map(getFuel).reduce(0, {(x, y) in x+y});
  }
}
