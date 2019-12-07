public class Part2 {
  var fuel: [Int]
  init(_ fuel: [Int]) {
    self.fuel = fuel;
  }
  static func getFuel(forMass mass:Int) -> Int{
    let fuel = mass/3 - 2;
    if(fuel < 0){
      return 0;
    } else {
      return fuel + getFuel(forMass: fuel)
    }
  }
  public static func sumFuel(fromMasses massList:[Int]) -> Int{
    return massList.map(getFuel).reduce(0, {(x, y) in x+y});
  }
}
