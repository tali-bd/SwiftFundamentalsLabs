/*:
 ## Exercise - Constants

 Declare a constant called `friends` to represent the number of friends you have on social media. Give it a value between 50 and 1000. Print out the value by referencing your constant.
 */
// let friends = 78
var friends = 78
print(friends)

/*:
 Now assume you go through and remove friends that aren't active on social media. Attempt to update your `friends` constant to a lower number than it currently is. Observe what happens and then move to the next step.
 */
friends = friends - 30

/*:
 Does the above code compile? Why not? Print your explanation to the console using the `print` function. Go back and delete your line of code that updates the `friends` constant to a lower number so that the playground will compile properly.
 */
// No, it does not compile
print("The code does not compile because 'friends' is a constant and it is impossible to change the value of a constant once it has been created")

//: page 1 of 10  |  [Next: App Exercise - Step Goal](@next)
