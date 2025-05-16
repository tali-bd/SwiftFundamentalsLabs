/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable{
    var name: String
    var age: Int
    
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
    
    var description: String{
        return("Human(Name: \(name), Age: \(age))")
    }
    
    static func ==(lhs: Human, rhs: Human) -> Bool
    {
            return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
    
    static func <(lhs: Human, rhs: Human) -> Bool
    {
        return(lhs.age < rhs.age)
    }
}

var human1 = Human(name: "Mandy", age: 24)
var human2 = Human(name: "Missy", age: 52)

/*:
 Make the `Human` class adopt the `CustomStringConvertible`. Print both of your previously initialized `Human` objects.
 */
print("Human1: \(human1), Human2: \(human2)")

/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
 */
print("Are human1 and human2 equal to each other? Results say: \(human1==human2)")
print("Are human1 and human2 different from each other? Results say: \(human1 != human2)")

/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
var human3 = Human(name: "Mike", age: 34)
var human4 = Human(name: "Mary", age: 14)
var human5 = Human(name: "Marvin", age: 89)

var people: [Human] = [human1, human2, human3, human4, human5]
var sortedPeople = people.sorted(by: <)


for person in sortedPeople{
    print(person)
}



/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation

let json = JSONEncoder()
if let jsonData = try? json.encode(human1),
    let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}
//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
