/*:
 ## Exercise - Create Functions
 
 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(name: String)
{
    print("Hi! My name is \(name). I am attending PCC")
}

introduceMyself(name: "Natalie")

/*:
 Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
 */
func magicEightBall(){
    let randomNum = Int.random(in: 0...4)
    //print(randomNum)
    
    switch randomNum
    {
    case 0:
        print("It will not come")
    case 1:
        print("It is not likely")
    case 2:
        print("It is 50/50")
    case 3:
        print("Your chances are good")
    case 4:
        print("Your future looks bright")
    default:
        print("Try again")
    }
    
}

magicEightBall()

//: page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
